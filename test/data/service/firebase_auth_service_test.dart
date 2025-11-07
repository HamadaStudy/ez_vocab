import 'package:ez_vocab/commons.dart';
import 'package:ez_vocab/data/services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'firebase_auth_service_test.mocks.dart';

@GenerateMocks([UserCredential, FirebaseAuth])
void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late FirebaseAuthService service;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    service = FirebaseAuthService(mockFirebaseAuth);
  });
  group('FirebaseAuthService - signIn', () {
    // ====================================================
    // # test1
    // ====================================================
    test('サインインが成功した場合、Result.okが返されること', () async {
      final mockUserCredential = MockUserCredential();

      when(
        mockFirebaseAuth.signInWithEmailAndPassword(
          email: anyNamed('email'),
          password: anyNamed('password'),
        ),
      ).thenAnswer((_) async => mockUserCredential);

      final result = await service.signIn('test@gmail.com', 'password123');

      expect(result, isA<Ok<UserCredential>>());
      expect((result as Ok<UserCredential>).value, mockUserCredential);
    });
    // ====================================================
    // # test2
    // ====================================================
    test('無効な認証情報でサインインが失敗した場合、Result.errorが返されること', () async {
      final exception = FirebaseAuthException(
        code: 'wrong-password',
        message: 'パスワードが間違っています',
      );

      when(
        mockFirebaseAuth.signInWithEmailAndPassword(
          email: anyNamed('email'),
          password: anyNamed('password'),
        ),
      ).thenThrow(exception);

      final result = await service.signIn('wrong@gamil.com', 'wrongpassword');

      expect(result, isA<Error<UserCredential>>());
      expect(
        (result as Error<UserCredential>).error,
        isA<FirebaseAuthException>(),
      );
    });
  });
}
