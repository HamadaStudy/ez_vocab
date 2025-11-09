import 'package:ez_vocab/data/providers/auth_service_provider.dart';
import 'package:ez_vocab/data/repositories/auth_repository.dart';
import 'package:ez_vocab/data/repositories/firebase_auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => throw UnimplementedError(),
);

final firebaseAuthRepositoryProvider = Provider<FirebaseAuthRepository>((ref) {
  final firebaseAuthService = ref.watch(firebaseAuthServiceProvider);
  return FirebaseAuthRepository(firebaseAuthService);
});
