// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object json) fromJsonT,
) {
  return BaseResponse<T>(
    json['status'] as int,
    fromJsonT(json['data']),
    json['total_counts'] as int,
    json['page_count'] as int,
    json['page'] as int,
  );
}

Map<String, dynamic> _$BaseResponseToJson<T>(
  BaseResponse<T> instance,
  Object Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': instance.status,
      'total_counts': instance.totalCounts,
      'page_count': instance.pageCount,
      'page': instance.currentPage,
      'data': toJsonT(instance.data),
    };
