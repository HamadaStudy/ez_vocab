import 'package:ez_vocab/commons.dart';

class AuthCustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final Icon? suffixIcon;
  final FormFieldValidator<String>? validator;

  const AuthCustomTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.controller,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(hintText: hintText, suffixIcon: suffixIcon),
      textAlignVertical: TextAlignVertical.center,
    );
  }
}
