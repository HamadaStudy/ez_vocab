import 'package:ez_vocab/data/repositories/auth_repository.dart';
import 'package:ez_vocab/data/services/firebase_auth_service.dart';
import 'package:ez_vocab/utils/reslut.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuthRepository(this._firebaseAuthService);

  final FirebaseAuthService _firebaseAuthService;

  // @override
  // Stream<Result<bool>> authStateChanges() {
  //   return _firebaseAuthService.authStateChanges().map((result) {
  //     return switch (result) {
  //       Ok(value: final user) => Result.ok(user != null),
  //       Error(error: final e, stackTrace: final st) => Result.error(e, st),
  //     };
  //   });
  // }

  @override
  Stream<Result<bool>> authStateChanges() {
    final result = _firebaseAuthService.authStateChanges();
    return result.map((result) {
      switch (result) {
        case Ok<User?>():
          return Result.ok(result.value != null);
        case Error<User?>():
          return Result.error(result.error, result.stackTrace);
      }
    });
  }

  @override
  Future<Result<void>> signIn(String email, String password) async {
    final result = await _firebaseAuthService.signIn(email, password);
    switch (result) {
      case Ok<UserCredential>():
        return Result.ok(null);
      case Error<UserCredential>():
        return result;
    }
  }

  @override
  Future<Result<void>> signUp(String email, String password) async {
    final result = await _firebaseAuthService.signUp(email, password);
    switch (result) {
      case Ok<UserCredential>():
        return Result.ok(null);
      case Error<UserCredential>():
        return result;
    }
  }

  @override
  Future<Result<void>> signOut() async {
    final result = await _firebaseAuthService.signOut();
    switch (result) {
      case Ok<void>():
        return Result.ok(null);
      case Error<void>():
        return result;
    }
  }
}
