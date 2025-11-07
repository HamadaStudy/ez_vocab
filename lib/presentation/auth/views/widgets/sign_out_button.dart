import 'package:ez_vocab/commons.dart';
import 'package:ez_vocab/presentation/auth/view_models/sign_out_view_model.dart';
import 'package:ez_vocab/presentation/auth/views/widgets/auth_custom_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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

    final success = await signOutViewModel.signOut();

    if (!mounted) return;

    if (success) {
      context.goNamed(AppRoute.signIn.name);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('サインアウトに失敗しました。')));
    }
  }
}
