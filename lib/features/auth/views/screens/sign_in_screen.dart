import 'package:ez_vocab/commons.dart';
import 'package:ez_vocab/features/auth/views/screens/sign_up_screen.dart';
import 'package:go_router/go_router.dart';
import '../widgets/auth_custom_text_field.dart';
import '../widgets/auth_custom_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.primary),
      body: Padding(
        padding: kPadd25,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            kGap30,

            Text('Welcome!', style: Theme.of(context).textTheme.headlineLarge),
            kGap30,

            Text('Sign In', style: Theme.of(context).textTheme.displayMedium),
            kGap60,

            Text('Email', style: Theme.of(context).textTheme.headlineSmall),
            AuthCustomTextField(
              controller: _emailController,
              hintText: 'Enter Email',
              keyboardType: TextInputType.emailAddress,
              suffixIcon: Icon(Icons.email),
            ),
            kGap15,

            Text('Password', style: Theme.of(context).textTheme.headlineSmall),
            AuthCustomTextField(
              controller: _passwordController,
              hintText: 'Enter Password',
              obscureText: true,
              suffixIcon: Icon(Icons.password),
            ),
            kGap30,

            AuthCustomButton(text: 'Sign In', onPressed: _handleSignIn),
            kGap30,

            _buildToggleText(context),
          ],
        ),
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
