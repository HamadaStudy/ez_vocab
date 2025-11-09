import 'package:ez_vocab/domain/models/auth/app_user.dart';
import 'package:ez_vocab/utils/reslut.dart';

abstract class AuthRepository {
  Stream<AppUser?> get currentAppUser;

  Future<Result<void>> signIn(String email, String password);
  Future<Result<void>> signUp(String email, String password);
  Future<Result<void>> signOut();
}
