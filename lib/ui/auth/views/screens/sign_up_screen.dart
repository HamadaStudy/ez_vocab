import 'package:ez_vocab/commons.dart';
import 'package:go_router/go_router.dart';
import '../widgets/auth_custom_text_field.dart';
import '../widgets/auth_custom_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: kPadd25,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              kGap15,

              Text('Sign Up', style: Theme.of(context).textTheme.displayMedium),
              kGap30,

              // ユーザー名入力フォーム
              Text('Name', style: Theme.of(context).textTheme.titleLarge),
              kGap5,
              AuthCustomTextField(
                controller: _usernameController,
                hintText: 'Enter Name',
                suffixIcon: Icon(Icons.person),
                validator: FormValidators.required('ユーザー名'),
              ),
              kGap15,

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
              Text('Password', style: Theme.of(context).textTheme.titleLarge),
              kGap5,
              AuthCustomTextField(
                controller: _passwordController,
                hintText: 'Enter Password',
                obscureText: true,
                suffixIcon: Icon(Icons.password),
                validator: FormValidators.passwordValidator,
              ),
              kGap15,

              // パスワード再入力フォーム
              Text(
                'Password (Confirm)',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              kGap5,
              AuthCustomTextField(
                controller: _passwordConfirmationController,
                hintText: 'Enter Password',
                obscureText: true,
                suffixIcon: Icon(Icons.password),
                validator: FormValidators.passwordConfirmationValidator(
                  _passwordController.text,
                ),
              ),
              kGap45,

              // 登録ボタン
              AuthCustomButton(
                text: 'Sign Up',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
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

  Widget _buildToggleText(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('すでにアカウントをお持ちですか？'),
          kGap15,
          GestureDetector(
            onTap: () {
              context.goNamed(AppRoute.signIn.name);
            },
            child: const Text(
              'サインインはこちら',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  void _handleSignUp() {
    final email = _emailController.text;
    final password = _passwordController.text;
    final username = _usernameController.text;

    // ここにサインアップ処理（FirebaseなどのAPI呼び出し）を記述
    print('サインアップ試行:');
    print('Email: $email, Password: $password, Username: $username');
    // 成功/失敗に応じてナビゲーションやメッセージ表示を行う
  }
}
