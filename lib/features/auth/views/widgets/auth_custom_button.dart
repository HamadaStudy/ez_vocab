import 'package:ez_vocab/commons.dart';

class AuthCustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AuthCustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          padding: kPaddv15,
          shape: RoundedRectangleBorder(borderRadius: kRadius30),
        ),
        child: Text(text, style: MyStyles.title),
      ),
    );
  }
}
