import 'package:ez_vocab/utils/reslut.dart';

abstract class AuthRepository {
  Future<Result<void>> signIn(String email, String password);
}
