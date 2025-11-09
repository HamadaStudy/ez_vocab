import 'package:ez_vocab/commons.dart';
import 'package:ez_vocab/presentation/auth/view_models/sign_out_view_model.dart';
import 'package:ez_vocab/presentation/auth/views/widgets/auth_custom_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignOutButton extends ConsumerStatefulWidget {
  const SignOutButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignOutButtonState();
}

class _SignOutButtonState extends ConsumerState<SignOutButton> {
  @override
  Widget build(BuildContext context) {
    return AuthCustomButton(text: 'Sign Out', onPressed: _handleSignOut);
  }

  // ==================== helper ====================
  Future<void> _handleSignOut() async {
    final signOutViewModel = ref.read(signOutViewModelProvider.notifier);

    final result = await signOutViewModel.signOut();
    final String snackBarMessage;

    if (!mounted) return;
    switch (result) {
      case Ok<void>():
        snackBarMessage = 'サインアウトに成功しました。';
      case Error<void>():
        snackBarMessage = result.error.message;
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(snackBarMessage)));
  }
}
