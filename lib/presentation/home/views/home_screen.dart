import 'package:ez_vocab/commons.dart';
import 'package:ez_vocab/presentation/auth/view_models/sign_out_view_model.dart';
import 'package:ez_vocab/presentation/auth/views/widgets/sign_out_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final signOutState = ref.watch(signOutViewModelProvider);
    return Scaffold(
      appBar: AppBar(),
      body:
          signOutState.isLoading
              ? Center(child: CircularProgressIndicator())
              : Padding(
                padding: kPadd25,
                child: Center(child: SignOutButton()),
              ),
    );
  }
}
