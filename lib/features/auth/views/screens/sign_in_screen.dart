// lib/screens/sign_in_screen.dart

import 'package:ez_vocab/commons.dart';
import 'package:flutter/material.dart';
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

  void _handleSignIn() {
    final email = _emailController.text;
    final password = _passwordController.text;

    // ここにサインイン処理（FirebaseなどのAPI呼び出し）を記述
    print('サインイン試行:');
    print('Email: $email, Password: $password');
    // 成功/失敗に応じてナビゲーションやメッセージ表示を行う
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('サインイン')),
      body: Padding(
        padding: kPadd15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AuthCustomTextField(
              controller: _emailController,
              hintText: 'Enter Email',
              keyboardType: TextInputType.emailAddress,
              suffixIcon: Icon(Icons.email),
            ),
            AuthCustomTextField(
              controller: _passwordController,
              hintText: 'Enter Password',
              obscureText: true,
              suffixIcon: Icon(Icons.password),
            ),
            kGap30,
            AuthCustomButton(text: 'サインイン', onPressed: _handleSignIn),
          ],
        ),
      ),
    );
  }
}
