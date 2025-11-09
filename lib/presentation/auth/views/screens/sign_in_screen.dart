import 'package:ez_vocab/commons.dart';
import 'package:ez_vocab/presentation/auth/view_models/sign_in_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../widgets/auth_custom_text_field.dart';
import '../widgets/auth_custom_button.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signInstate = ref.watch(signInViewModelProvider);

    return Scaffold(
      appBar: AppBar(),
      body:
          signInstate.isLoading
              ? Center(child: const CircularProgressIndicator())
              : Padding(
                padding: kPadd25,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      kGap15,

                      // タイトル
                      Text(
                        'Sign In',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      kGap30,

                      // メールアドレス入力フォーム
                      Text(
                        'Email',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      kGap5,
                      AuthCustomTextField(
                        controller: _emailController,
                        hintText: 'Enter Email',
                        keyboardType: TextInputType.emailAddress,
                        suffixIcon: Icon(Icons.email),
                        validator: FormValidators.emailValidator,
                      ),
                      kGap15,

                      // パスワード入力フォーム
                      Text(
                        'Password',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      kGap5,
                      AuthCustomTextField(
                        controller: _passwordController,
                        hintText: 'Enter Password',
                        obscureText: true,
                        suffixIcon: Icon(Icons.password),
                        validator: FormValidators.required('パスワード'),
                      ),
                      kGap45,

                      // サインインボタン
                      AuthCustomButton(
                        text: 'Sign In',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _handleSignIn();
                          }
                        },
                      ),

                      kGap30,

                      _buildToggleText(context),
                    ],
                  ),
                ),
              ),
    );
  }

  // ====helperメソッド====
  Future<void> _handleSignIn() async {
    final signInViewModel = ref.read(signInViewModelProvider.notifier);

    final success = await signInViewModel.signIn(
      _emailController.text,
      _passwordController.text,
    );

    if (!mounted) return;

    if (!success) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('ログインに失敗しました。')));
    }
  }

  Widget _buildToggleText(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('アカウントをお持ちでないですか？'),
          kGap15,
          GestureDetector(
            onTap: () {
              context.goNamed(AppRoute.signUp.name);
            },
            child: const Text(
              'サインアップはこちら',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
