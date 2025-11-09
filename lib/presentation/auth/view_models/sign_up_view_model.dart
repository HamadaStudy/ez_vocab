import 'dart:async';

import 'package:ez_vocab/commons.dart';
import 'package:ez_vocab/data/providers/auth_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  @override
  Future<void> build() async {
    AsyncValue.data(null);
  }

  Future<Result<void>> signUp(String email, String password) async {
    final authRepository = ref.watch(authRepositoryProvider);
    state = const AsyncValue.loading();
    final result = await authRepository.signUp(email, password);
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

final signUpViewModelProvider = AsyncNotifierProvider.autoDispose(
  SignUpViewModel.new,
);
