import 'dart:async';

import 'package:ez_vocab/commons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInViewModel extends AsyncNotifier<void> {
  @override
  Future<void> build() async {
    AsyncValue.data(null);
  }

  Future<void> signIn() async {
    state = AsyncValue.loading();
    await Future.delayed(Duration(seconds: 2));
    state = AsyncValue.data(null);
  }
}

final signInViewModelProvider = AsyncNotifierProvider.autoDispose(
  SignInViewModel.new,
);
