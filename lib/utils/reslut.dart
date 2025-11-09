import 'package:ez_vocab/utils/app_exception.dart';

sealed class Result<T> {
  const Result._();

  const factory Result.ok(T value) = Ok._;
  const factory Result.error(AppException error, StackTrace stackTrace) =
      Error._;
}

class Ok<T> extends Result<T> {
  const Ok._(this.value) : super._();

  final T value;

  @override
  String toString() => 'Result<$T>.ok($value)';
}

class Error<T> extends Result<T> {
  const Error._(this.error, this.stackTrace) : super._();

  final AppException error;
  final StackTrace stackTrace;

  @override
  String toString() => 'Result<$T>.error($error)';
}
