import 'package:ez_vocab/commons.dart';
import 'package:ez_vocab/data/providers/auth_repository_provider.dart';
import 'package:ez_vocab/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ProviderScope(
      overrides: [
        authRepositoryProvider.overrideWith(
          ((ref) => ref.watch(firebaseAuthRepositoryProvider)),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      routerConfig: router,
      title: 'EZ-Vocab',
      theme: lightTheme,
    );
  }
}
