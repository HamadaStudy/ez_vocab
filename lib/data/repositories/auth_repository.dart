import 'package:ez_vocab/utils/reslut.dart';

abstract class AuthRepository {
  Stream<Result<bool>> authStateChanges();

  Future<Result<void>> signIn(String email, String password);
  Future<Result<void>> signUp(String email, String password);
  Future<Result<void>> signOut();
}
