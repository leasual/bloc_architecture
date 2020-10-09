import 'package:bloc_architecture/core/network_exceptions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
abstract class Result<T> with _$Result {

  const factory Result.loading() = _Loading;
  // const factory Result.noMoreData() = _NoMoreData;
  const factory Result.success(T data, int totalPage, int currentPage) = _Success;
  const factory Result.failure(NetworkExceptions error) = _Failure;
}