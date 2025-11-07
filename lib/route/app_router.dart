import 'package:ez_vocab/presentation/auth/views/screens/sign_in_screen.dart';
import 'package:ez_vocab/presentation/auth/views/screens/sign_up_screen.dart';
import 'package:ez_vocab/presentation/home/views/home_screen.dart';
import 'package:ez_vocab/presentation/splash/views/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:ez_vocab/commons.dart';

enum AppRoute {
  splash(path: '/', name: 'Splash'),
  signIn(path: '/signin', name: 'SignIn'),
  signUp(path: '/signup', name: 'SignUp'),
  home(path: '/home', name: 'Home');

  const AppRoute({required this.path, required this.name});

  final String path;
  final String name;
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
  );
});
