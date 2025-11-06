import 'package:ez_vocab/commons.dart';
import 'package:ez_vocab/data/services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';

final mockUser = MockUser(
  uid: 'some_uid',
  email: 'test@gmail.com',
  displayName: 'Test User',
);

void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late FirebaseAuthService service;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth(mockUser: mockUser);
    service = FirebaseAuthService(firebaseAuthInstance: mockFirebaseAuth);
  });
  group('FirebaseAuthService - signIn', () {
    test('サインインが成功した場合、Result.okが返されること', () async {
      final result = await service.signIn('test@gmail.com', 'password123');

      expect(result, isA<Ok<UserCredential>>());
      expect((result as Ok<UserCredential>).value.user?.email, mockUser.email);
    });

    test('無効な認証情報でサインインが失敗した場合、Result.errorが返されること', () async {
      final result = await service.signIn('wrong@gamil.com', 'badpassword');

      expect(result, isA<Error<UserCredential>>());
      expect(
        (result as Error<UserCredential>).error,
        isA<FirebaseAuthException>(),
      );
    });
  });
}
