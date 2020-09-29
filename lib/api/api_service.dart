import 'package:bloc_architecture/core/base_response.dart';
import 'package:bloc_architecture/core/network_exceptions.dart';
import 'package:bloc_architecture/di/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:injectable/injectable.dart';

@singleton
class APIService {

  final String tag = "APIService";

  Future<Either<NetworkExceptions, dynamic>> get(String path, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async {
    return Task(() =>
        dio.get(
            path,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress
        ))
        .attempt()
    // .mapLeftToFailure()
        .mapRightToFailure()
        .run();
  }
}

extension TaskX<T extends Either<Object, U>, U> on Task<T> {

  Task<Either<NetworkExceptions, U>> mapLeftToFailure() {
    return this.map((a) => a.leftMap((error) {
      logger.e("Task", "error= $error isLeft= ${a.isLeft()}");
      return NetworkExceptions.getDioException(error);
    }));
  }

  Task<Either<NetworkExceptions, U>> mapRightToFailure() {
    return this.map((a) => a.swap().leftMap((r) {
      logger.e("Task", "error= $r isLeft= ${a.isLeft()}");
      final jsonResult = json.decode((r as Response).data.toString());
      final data = BaseResponse.fromJson(jsonResult, null);
      logger.d("Task", "code= ${data.status}");
      if(data.status == 100) {
        return r;
      } else {
        return this.map((a) => NetworkExceptions.formatException());
      }
    }));

  }
}