import 'package:ez_vocab/commons.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuthInstance;

  FirebaseAuthService(this._firebaseAuthInstance);
  Stream<Result<User?>> authStateChanges() {
    try {
      return _firebaseAuthInstance
          .authStateChanges()
          .map((user) => Result.ok(user))
          .handleError((error, stackTrace) {
            if (error is Exception) {
              return Result.error(error, stackTrace);
            }
            // Exceptionでない場合は汎用的なエラーに変換
            return Result.error(
              Exception('Unexpected error: $error'),
              stackTrace,
            );
          });
    } on Exception catch (e, st) {
      // Stream生成自体が失敗した場合
      return Stream.value(Result.error(e, st));
    }
  }

  Future<Result<UserCredential>> signIn(String email, String password) async {
    try {
      final response = await _firebaseAuthInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Result.ok(response);
    } on Exception catch (e, st) {
      return Result.error(e, st);
    }
  }

  Future<Result<UserCredential>> signUp(String email, String password) async {
    try {
      final response = await _firebaseAuthInstance
          .createUserWithEmailAndPassword(email: email, password: password);
      return Result.ok(response);
    } on Exception catch (e, st) {
      return Result.error(e, st);
    }
  }

  Future<Result<void>> signOut() async {
    try {
      await _firebaseAuthInstance.signOut();
      return Result.ok(null);
    } on Exception catch (e, st) {
      return Result.error(e, st);
    }
  }
}
