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
      appBar: AppBar(title: const Text('新規登録'), centerTitle: true),
      body: Padding(
        padding: kPadd15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AuthCustomTextField(
              controller: _emailController,
              labelText: 'メールアドレス',
              keyboardType: TextInputType.emailAddress,
            ),
            AuthCustomTextField(
              controller: _passwordController,
              labelText: 'パスワード',
              obscureText: true,
            ),
            AuthCustomTextField(
              controller: _usernameController,
              labelText: 'ユーザー名',
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
