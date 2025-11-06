import 'package:ez_vocab/commons.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth firebaseAuthInstance;

  FirebaseAuthService({required this.firebaseAuthInstance});

  Future<Result<UserCredential>> signIn(String email, String password) async {
    try {
      final response = await firebaseAuthInstance
          .createUserWithEmailAndPassword(email: email, password: password);
      return Result.ok(response);
    } on Exception catch (e, st) {
      return Result.error(e, st);
    }
  }
}
