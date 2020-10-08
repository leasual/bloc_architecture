import 'dart:io';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

@sealed
abstract class NetworkExceptions {

  String message;
  int code;

  NetworkExceptions({this.message, this.code});

  static NetworkExceptions handleResponse(int statusCode) {
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return UnauthorizedRequest();
        break;
      case 404:
        return NotFound();
        break;
      case 409:
        return Conflict();
        break;
      case 408:
        return RequestTimeout();
        break;
      case 500:
        return InternalServerError();
        break;
      case 503:
        return ServiceUnavailable();
        break;
      default:
        var responseCode = statusCode;
        return DefaultError("default error", responseCode);
    }
  }
  static NetworkExceptions getDioException(error) {
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.CANCEL:
              networkExceptions = DefaultError("Cancel", -100);
              break;
            case DioErrorType.CONNECT_TIMEOUT:
              networkExceptions = RequestTimeout();
              break;
            case DioErrorType.DEFAULT:
              networkExceptions = NoInternetConnection();
              break;
            case DioErrorType.RECEIVE_TIMEOUT:
              networkExceptions = DefaultError("ReceiveTimeout", -100);
              break;
            case DioErrorType.RESPONSE:
              networkExceptions =
                  NetworkExceptions.handleResponse(error.response.statusCode);
              break;
            case DioErrorType.SEND_TIMEOUT:
              networkExceptions = DefaultError("SendTimeout", -100);
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = NoInternetConnection();
        } else {
          networkExceptions = DefaultError("UnExpected", -100);
        }
        return networkExceptions;
      } on FormatException catch (e) {
        // Helper.printError(e.toString());
        return FormatException();
      } catch (_) {
        return DefaultError("UnExpected", -100);
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return DefaultError("UnExpected", -100);
      } else {
        return DefaultError("UnExpected", -100);
      }
    }
  }

  static ServerError handleServerError(int code, String message) {
    return ServerError(message, code);
  }
}

class UnauthorizedRequest extends NetworkExceptions { }
class NotFound extends NetworkExceptions { }
class RequestTimeout extends NetworkExceptions { }
class InternalServerError extends NetworkExceptions { }
class ServiceUnavailable extends NetworkExceptions { }
class DefaultError extends NetworkExceptions { DefaultError(message, code); }
class Conflict extends NetworkExceptions { }
class NoInternetConnection extends NetworkExceptions { }
class FormatException extends NetworkExceptions { }
class ServerError extends NetworkExceptions { ServerError(message, code); }