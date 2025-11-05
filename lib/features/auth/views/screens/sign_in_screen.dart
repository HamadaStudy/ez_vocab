import 'package:ez_vocab/commons.dart';
import 'package:ez_vocab/features/auth/view_models/sign_in_view_model.dart';
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
  final TextEditingController _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _handleSignIn() {
    final email = _emailController.text;
    final password = _passwordController.text;
    final username = _usernameController.text;

    // ここにサインアップ処理（FirebaseなどのAPI呼び出し）を記述
    print('サインアップ試行:');
    print('Email: $email, Password: $password, Username: $username');
    // 成功/失敗に応じてナビゲーションやメッセージ表示を行う
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signInViewModelProvider);
    final viewModel = ref.watch(signInViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(),
      body: state.when(
        data: (_) {
          return Padding(
            padding: kPadd25,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  kGap15,

                  Text(
                    'Sign In',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  kGap30,

                  // メールアドレス入力フォーム
                  Text('Email', style: Theme.of(context).textTheme.titleLarge),
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
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                        viewModel.signIn();
                      }
                    },
                  ),
                  kGap30,

                  _buildToggleText(context),
                ],
              ),
            ),
          );
        },
        error: (e, st) => Container(),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
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
