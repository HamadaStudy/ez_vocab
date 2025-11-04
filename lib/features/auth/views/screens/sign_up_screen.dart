// lib/screens/sign_up_screen.dart

import 'package:ez_vocab/commons.dart';
import 'package:ez_vocab/features/auth/views/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/auth_custom_text_field.dart';
import '../widgets/auth_custom_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  void _handleSignUp() {
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
            Text('Sign Up', style: Theme.of(context).textTheme.displayMedium),
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
            kGap15,
            Text('Password', style: Theme.of(context).textTheme.headlineSmall),
            AuthCustomTextField(
              controller: _usernameController,
              hintText: 'Enter User Name',
              suffixIcon: Icon(Icons.person),
            ),
            kGap30,
            AuthCustomButton(text: 'サインアップ', onPressed: _handleSignUp),
            kGap15,
            _buildToggleText(context),
          ],
        ),
      ),
    );
  }
}

Widget _buildToggleText(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      const Text('アカウントをお持ちでないですか？'),
      const SizedBox(width: 5),
      GestureDetector(
        onTap: () {
          // サインアップ画面への遷移処理
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignInScreen()),
          );
        },
        child: const Text(
          '新規登録はこちら',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue, // リンクであることを示すために色を付ける
          ),
        ),
      ),
    ],
  );
}
