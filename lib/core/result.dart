import 'package:meta/meta.dart';

@sealed
class Result<T> { }

class Loading<T> extends Result<T> {
  final T value;
  Loading(this.value);
}

class Success<T> extends Result<T> {
  final T data;
  Success(this.data);
}

class Failure<T> extends Result<T> {
  final T error;
  Failure(this.error);
}