import 'package:ez_vocab/data/providers/auth_repository_provider.dart';
import 'package:ez_vocab/domain/models/auth/app_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentAppUserProvider = StreamProvider<AppUser?>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return repository.currentAppUser;
});
