sealed class AppException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  AppException._(this.message, [this.stackTrace]);

  factory AppException.firebaseAuthException(
    String errorCode,
    StackTrace? stackTrace,
  ) => AppFirebaseAuthException._(errorCode, stackTrace);

  factory AppException.unknownException(StackTrace? stackTrace) =>
      AppUnknownException._(stackTrace);

  @override
  String toString() => '$runtimeType: $message';
}

class AppFirebaseAuthException extends AppException {
  final String errorCode;

  AppFirebaseAuthException._(this.errorCode, StackTrace? stackTrace)
    : super._(_mapCodeToMessage(errorCode), stackTrace);

  static String _mapCodeToMessage(String errorCode) {
    return switch (errorCode) {
      'email-already-in-use' => 'このメールアドレスは既に他のアカウントで使用されています。',
      'weak-password' => 'パスワードが弱すぎます。より強力なものを使用してください。',
      'invalid-email' => '不正な形式のメールアドレスです。',
      'user-disabled' => 'このユーザーアカウントは停止されています。',
      'user-not-found' => '対応するユーザーが見つかりません。',
      'wrong-password' ||
      'invalid-credential' ||
      'INVALID_LOGIN_CREDENTIALS' => '認証情報が無効です。メールアドレスまたはパスワードを確認してください。',
      'too-many-requests' => 'リクエストが多すぎます。しばらく待ってから再度お試しください。',
      'user-token-expired' => 'セッションの有効期限が切れました。再度ログインしてください。',
      'network-request-failed' => 'ネットワーク接続エラーが発生しました。インターネット接続を確認してください。',
      'operation-not-allowed' => 'サーバー設定により、現在この認証方法は許可されていません。',
      _ => '不明な認証エラーが発生しました。（コード: $errorCode）',
    };
  }
}

class AppUnknownException extends AppException {
  AppUnknownException._(StackTrace? stackTrace)
    : super._('不明なエラーが発生しました。', stackTrace);
}
