import 'package:ez_vocab/data/repositories/auth_repository.dart';
import 'package:ez_vocab/data/services/firebase_auth_service.dart';
import 'package:ez_vocab/utils/reslut.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuthRepository({required this.firebaseAuthService});

  final FirebaseAuthService firebaseAuthService;

  @override
  Future<Result<void>> signIn(String email, String password) async {
    final result = await firebaseAuthService.signIn(email, password);
    switch (result) {
      case Ok<UserCredential>():
        return Result.ok(null);
      case Error<UserCredential>():
        return result;
    }
  }

  @override
  Future<Result<void>> signUp(String email, String password) async {
    final result = await firebaseAuthService.signUp(email, password);
    switch (result) {
      case Ok<UserCredential>():
        return Result.ok(null);
      case Error<UserCredential>():
        return result;
    }
  }
}
