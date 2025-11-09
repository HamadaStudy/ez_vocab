import 'package:ez_vocab/commons.dart';
import 'package:ez_vocab/data/providers/current_app_user_provider.dart';
import 'package:ez_vocab/domain/models/auth/app_user.dart';
import 'package:ez_vocab/presentation/auth/views/screens/sign_in_screen.dart';
import 'package:ez_vocab/presentation/auth/views/screens/sign_up_screen.dart';
import 'package:ez_vocab/presentation/home/views/home_screen.dart';
import 'package:ez_vocab/presentation/splash/views/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class _GoRouterRefreshNotifier extends ValueNotifier<bool?> {
//   _GoRouterRefreshNotifier() : super(null);
//   void change(bool? v) => value = v;
// }

enum AppRoute {
  splash(path: '/', name: 'Splash'),
  signIn(path: '/auth/signin', name: 'SignIn'),
  signUp(path: '/auth/signup', name: 'SignUp'),
  home(path: '/home', name: 'Home');

  const AppRoute({required this.path, required this.name});

  final String path;
  final String name;
}

class _GoRouterRefreshNotirier extends ChangeNotifier {
  _GoRouterRefreshNotirier(Ref ref) : super() {
    ref.listen(currentAppUserProvider, (_, __) => notifyListeners());
  }
}

final goRouterProvider = Provider<GoRouter>((ref) {
  //TODO: 認証状態の監視

  return GoRouter(
    navigatorKey: GlobalKey(),
    routes: <RouteBase>[
      GoRoute(
        path: AppRoute.splash.path,
        name: AppRoute.splash.name,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: AppRoute.signIn.path,
        name: AppRoute.signIn.name,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: AppRoute.signUp.path,
        name: AppRoute.signUp.name,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: AppRoute.home.path,
        name: AppRoute.home.name,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
    refreshListenable: _GoRouterRefreshNotirier(ref),
    redirect: (context, state) {
      final currentAppUser = ref.read(currentAppUserProvider);
      return currentAppUser.when(
        data: (appUser) {
          return _handleAuthRedirect(appUser, state);
        },
        error: (e, st) {
          return AppRoute.home.path;
        },
        loading: () => null,
      );
    },
  );
});

// ==================== helper ====================

String? _handleAuthRedirect(AppUser? appUser, GoRouterState state) {
  final isLoggedIn = appUser != null;
  final isAuthRoute = state.matchedLocation.startsWith('/auth');

  if (!isLoggedIn && !isAuthRoute) return AppRoute.signIn.path;
  if (isLoggedIn && isAuthRoute) return AppRoute.home.path;
  return null;
}
