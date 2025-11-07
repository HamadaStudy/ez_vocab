import 'package:ez_vocab/commons.dart';
import 'package:ez_vocab/data/providers/auth_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateChangesProvider = StreamProvider<Result<bool>>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return repository.authStateChanges();
});
