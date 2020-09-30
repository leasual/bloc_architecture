import 'package:bloc_architecture/core/base_response.dart';
import 'package:bloc_architecture/core/network_exceptions.dart';
import 'package:bloc_architecture/di/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class DioHelper {
  final String tag = "APIService";

  //TODO 使用dart扩展
  Task<Either<NetworkExceptions, dynamic>> get(
    String path, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  })  {
    return Task(() => dio.get(path,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress))
        .attempt()
        .mapFailureAndServerError();

  }

  Task<Either<NetworkExceptions, dynamic>> post(
      String path, {
        Map<String, dynamic> queryParameters,
        Options options,
        CancelToken cancelToken,
        ProgressCallback onReceiveProgress,
      })  {
    return Task(() => dio.post(path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress))
        .attempt()
        .mapFailureAndServerError();

  }
}

extension TaskX<T extends Either<Object, U>, U> on Task<T> {

  Task<Either<NetworkExceptions, U>> mapLeftToFailure() {
    return this.map((a) => a.leftMap((error) {
          logger.e("Task", "error= $error isLeft= ${a.isLeft()}");
          return NetworkExceptions.getDioException(error);
        }));
  }

  Task<Either<NetworkExceptions, U>> mapFailureAndServerError() {
    return this.map((a) {
      logger.d("Task", "isLeft= ${a.isLeft()}");
      if (a.isLeft()) {
        return left(NetworkExceptions.formatException());
      } else {
        var result;
        a.fold(
          (error) {
            logger.e("Task", "error= $error");
          },
          (data) {
            //get server status code to judge whether server error
            //注意(j) => null 一定要加上前段(j) =>不然报错
            //因为这里要传入的是一个方法，BaseResponse.fromJson不是一个方法
            //https://github.com/google/json_serializable.dart/issues/723
            final response =
                BaseResponse.fromJson((data as Response).data, (j) => null);
            logger.d("Task", "code= ${response.status}");
            if (response.isSuccess()) {
              result = right<NetworkExceptions, dynamic>((data as Response).data);
            } else {
              result = left<NetworkExceptions, dynamic>(
                  NetworkExceptions.formatException());
            }
          },
        );
        return result;
      }
    });
  }
}
