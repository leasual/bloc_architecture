import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

@freezed
abstract class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = _RequestCancelled;

  const factory NetworkExceptions.unauthorizedRequest() = _UnauthorizedRequest;

  const factory NetworkExceptions.badRequest() = _BadRequest;

  const factory NetworkExceptions.notFound(String reason) = _NotFound;

  const factory NetworkExceptions.methodNotAllowed() = _MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = _NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = _RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = _SendTimeout;

  const factory NetworkExceptions.conflict() = _Conflict;

  const factory NetworkExceptions.internalServerError() = _InternalServerError;

  const factory NetworkExceptions.notImplemented() = _NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = _ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() =
      _NoInternetConnection;

  const factory NetworkExceptions.formatException() = _FormatException;

  const factory NetworkExceptions.unableToProcess() = _UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = _DefaultError;

  const factory NetworkExceptions.unexpectedError() = _UnexpectedError;

  const factory NetworkExceptions.serverError(String message, int code) =
      _ServerError;

  static NetworkExceptions handleResponse(int statusCode) {
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return NetworkExceptions.unauthorizedRequest();
        break;
      case 404:
        return NetworkExceptions.notFound("Not Found");
        break;
      case 409:
        return NetworkExceptions.conflict();
        break;
      case 408:
        return NetworkExceptions.requestTimeout();
        break;
      case 500:
        return NetworkExceptions.internalServerError();
        break;
      case 503:
        return NetworkExceptions.serviceUnavailable();
        break;
      default:
        var responseCode = statusCode;
        return NetworkExceptions.defaultError("default error $responseCode");
    }
  }

  static NetworkExceptions getDioException(error) {
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.CANCEL:
              networkExceptions = NetworkExceptions.defaultError("Cancel -100");
              break;
            case DioErrorType.CONNECT_TIMEOUT:
              networkExceptions = NetworkExceptions.requestTimeout();
              break;
            case DioErrorType.DEFAULT:
              networkExceptions = NetworkExceptions.noInternetConnection();
              break;
            case DioErrorType.RECEIVE_TIMEOUT:
              networkExceptions =
                  NetworkExceptions.defaultError("ReceiveTimeout -100");
              break;
            case DioErrorType.RESPONSE:
              networkExceptions =
                  NetworkExceptions.handleResponse(error.response.statusCode);
              break;
            case DioErrorType.SEND_TIMEOUT:
              networkExceptions =
                  NetworkExceptions.defaultError("SendTimeout -100");
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions =
              NetworkExceptions.defaultError("UnExpected - 100");
        }
        return networkExceptions;
      } on FormatException catch (e) {
        // Helper.printError(e.toString());
        return NetworkExceptions.formatException();
      } catch (_) {
        return NetworkExceptions.defaultError("UnExpected -100");
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return NetworkExceptions.defaultError("UnExpected -100");
      } else {
        return NetworkExceptions.defaultError("UnExpected -100");
      }
    }
  }

  static NetworkExceptions handleServerError(int code, String message) {
    return NetworkExceptions.serverError(message, code);
  }
}
