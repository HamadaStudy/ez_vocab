import 'package:ez_vocab/commons.dart';
import 'package:ez_vocab/utils/app_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuthInstance;
  FirebaseAuthService(this._firebaseAuthInstance);

  Stream<Result<User?>> authStateChanges() {
    try {
      return _firebaseAuthInstance.authStateChanges().map(
        (user) => Result.ok(user),
      );
    } on FirebaseAuthException catch (e, st) {
      final exception = AppException.firebaseAuthException(e.code, st);
      return Stream.value(Result.error(exception, st));
    } catch (e, st) {
      final exception = AppException.unknownException(st);
      return Stream.value(Result.error(exception, st));
    }
  }

  Future<Result<UserCredential>> signIn(String email, String password) async {
    try {
      final response = await _firebaseAuthInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Result.ok(response);
    } on FirebaseAuthException catch (e, st) {
      final exception = AppException.firebaseAuthException(e.code, st);
      return Result.error(exception, st);
    } catch (e, st) {
      final exception = AppException.unknownException(st);
      return Result.error(exception, st);
    }
  }

  Future<Result<UserCredential>> signUp(String email, String password) async {
    try {
      final response = await _firebaseAuthInstance
          .createUserWithEmailAndPassword(email: email, password: password);
      return Result.ok(response);
    } on FirebaseAuthException catch (e, st) {
      final exception = AppException.firebaseAuthException(e.code, st);
      return Result.error(exception, st);
    } catch (e, st) {
      final exception = AppException.unknownException(st);
      return Result.error(exception, st);
    }
  }

  Future<Result<void>> signOut() async {
    try {
      await _firebaseAuthInstance.signOut();
      return Result.ok(null);
    } on FirebaseAuthException catch (e, st) {
      final exception = AppException.firebaseAuthException(e.code, st);
      return Result.error(exception, st);
    } catch (e, st) {
      final exception = AppException.unknownException(st);
      return Result.error(exception, st);
    }
  }
}
