// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'girl_photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GirlPhotoListModel _$GirlPhotoListModelFromJson(Map<String, dynamic> json) {
  return GirlPhotoListModel(
    (json['girlPhotoList'] as List)
        ?.map((e) => e == null
            ? null
            : GirlPhotoModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GirlPhotoListModelToJson(GirlPhotoListModel instance) =>
    <String, dynamic>{
      'girlPhotoList': instance.girlPhotoList,
    };

GirlPhotoModel _$GirlPhotoModelFromJson(Map<String, dynamic> json) {
  return GirlPhotoModel(
    json['_id'] as String,
    json['author'] as String,
    json['category'] as String,
    json['createAt'] as String,
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

Map<String, dynamic> _$GirlPhotoModelToJson(GirlPhotoModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'author': instance.author,
      'category': instance.category,
      'createAt': instance.createAt,
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
