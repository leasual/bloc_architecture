import 'package:bloc_architecture/core/i_base_response.dart';
import 'package:dartz/dartz.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> extends IBaseResponse{
  final int status;
  T data;

  BaseResponse(
      this.status,
      this.data,
      );



  factory BaseResponse.fromJson(Map<String, dynamic> srcJson, fromJson)
    => _$BaseResponseFromJson<T>(srcJson, fromJson);

  Map<String, dynamic> toJson(toJson) => _$BaseResponseToJson(this, toJson);

  @override
  String toString() {
    return 'BaseResponse{status: $status, data: $data}';
  }

  @override
  int code() => status;

  @override
  bool isSuccess() => status == 100;

  @override
  String message() => "";


}