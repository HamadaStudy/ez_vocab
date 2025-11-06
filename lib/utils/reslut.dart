sealed class Result<T> {
  const Result();

  const factory Result.ok(T value) = Ok._;
  const factory Result.error(Exception error, StackTrace stackTrace) = Error._;
}

final class Ok<T> extends Result<T> {
  const Ok._(this.value);

  final T value;

  @override
  String toString() => 'Result<$T>.ok($value)';
}

final class Error<T> extends Result<T> {
  const Error._(this.error, this.stackTrace);

  final Exception error;
  final StackTrace stackTrace;

  @override
  String toString() => 'Result<$T>.error($error)';
}
