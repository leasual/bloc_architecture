// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gank_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GankListModel _$GankListModelFromJson(Map<String, dynamic> json) {
  return GankListModel(
    (json['gankModelList'] as List)
        ?.map((e) =>
            e == null ? null : GankModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GankListModelToJson(GankListModel instance) =>
    <String, dynamic>{
      'gankModelList': instance.gankModelList,
    };

GankModel _$GankModelFromJson(Map<String, dynamic> json) {
  return GankModel(
    json['_id'] as String,
    json['author'] as String,
    json['category'] as String,
    json['createdAt'] as String,
    json['desc'] as String,
    (json['images'] as List)?.map((e) => e as String)?.toList(),
    json['likeCounts'] as int,
    json['publishAt'] as String,
    json['stars'] as int,
    json['title'] as String,
    json['type'] as String,
    json['url'] as String,
    json['views'] as int,
  );
}

Map<String, dynamic> _$GankModelToJson(GankModel instance) => <String, dynamic>{
      '_id': instance.id,
      'author': instance.author,
      'category': instance.category,
      'createdAt': instance.createdAt,
      'desc': instance.desc,
      'images': instance.images,
      'likeCounts': instance.likeCounts,
      'publishAt': instance.publishAt,
      'stars': instance.stars,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
      'views': instance.views,
    };
