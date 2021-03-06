import 'package:bloc_architecture/core/i_base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> extends IBaseResponse {
  final int status;
  @JsonKey(name: 'total_counts')
  final int totalCounts;
  @JsonKey(name: 'page_count')
  final int pageCount;
  @JsonKey(name: 'page')
  final int currentPage;
  T data;

  BaseResponse(
    this.status,
    this.data,
    this.totalCounts,
    this.pageCount,
    this.currentPage,
  );

  factory BaseResponse.fromJson(Map<String, dynamic> srcJson, fromJson) =>
      _$BaseResponseFromJson<T>(srcJson, fromJson);

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
