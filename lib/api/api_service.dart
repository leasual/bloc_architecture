import 'package:bloc_architecture/di/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class APIService {

  final String tag = "APIService";

  Future<Either<Failure, dynamic>> get(String path, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async {
    logger.d(tag, "get data");
    // Response response = await dio.get(
    //     path,
    //     queryParameters: queryParameters,
    //     options: options,
    //     cancelToken: cancelToken,
    //     onReceiveProgress: onReceiveProgress
    // );
    // logger.d(tag, "get data= ${response.data}");
    return Task(() =>
        dio.get(
            path,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress
        ))
        .attempt()
        .mapLeftToFailure()
        .run();
        // .then((value) => logger.d(tag, "get result= $value"));
  }
}

extension TaskX<T extends Either<Object, U>, U> on Task<T> {
  Task<Either<Failure, U>> mapLeftToFailure() {
    //TODO according to error type transform to failure
    return this.map((a) => a.leftMap((error) {
      logger.e("Task", "error= $error");
      if(error is DioError) {
        if(error.response != null) {
          logger.e("Task", "data= ${error.response.data}");
          logger.e("Task", "header= ${error.response.headers}");
          logger.e("Task", "request= ${error.response.request}");
        } else {
          logger.e("Task", "request= ${error.request}");
          logger.e("Task", "message= ${error.message}");
        }
      }
      return error;
    }));
    // return this.map((either) => either.leftMap((obj) {
    //     try {
    //       return obj as Failure;
    //     } catch (e) {
    //       throw obj;
    //     }
    //   }),
    // );
  }
}

class Failure {
  final String message;
  final int code;
  Failure(this.message, this.code);

  @override
  String toString() => "message= $message code= $code";
}