import 'package:ez_vocab/features/auth/views/widgets/auth_custom_button.dart';
import 'package:ez_vocab/features/auth/views/widgets/auth_custom_text_field.dart';
import 'package:ez_vocab/styles/sizes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ez-vocab')),
      body: Padding(
        padding: kPadd15,
        child: Center(
          child: Column(
            children: [
              AuthCustomButton(text: 'hello', onPressed: () {}),
              AuthCustomTextField(labelText: 'good nigth'),
            ],
          ),
        ),
      ),
    );
  }
}
