import 'dart:async';

import 'package:ez_vocab/commons.dart';
import 'package:ez_vocab/data/providers/auth_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInViewModel extends AsyncNotifier<void> {
  @override
  Future<void> build() async {
    AsyncValue.data(null);
  }

  Future<Result<void>> signIn(String email, String password) async {
    final authRepository = ref.watch(authRepositoryProvider);
    state = const AsyncValue.loading();
    final result = await authRepository.signIn(email, password);
    switch (result) {
      case Ok<void>():
        state = AsyncValue.data(null);
        return result;
      case Error<void>():
        state = AsyncValue.error(result.error, result.stackTrace);
        return result;
    }
  }
}

final signInViewModelProvider = AsyncNotifierProvider.autoDispose(
  SignInViewModel.new,
);
