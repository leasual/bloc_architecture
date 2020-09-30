import 'package:json_annotation/json_annotation.dart';

part 'girl_photo_model.g.dart';

@JsonSerializable()
class GirlPhotoListModel extends Object {

  // @JsonKey(name: 'data')
  final List<GirlPhotoModel> girlPhotoList;


  GirlPhotoListModel(this.girlPhotoList);

  factory GirlPhotoListModel.fromJson(Map<String, dynamic> json) =>
  _$GirlPhotoListModelFromJson(json);


  Map<String, dynamic> toJson() => _$GirlPhotoListModelToJson(this);
}

@JsonSerializable()
class GirlPhotoModel extends Object {

  // {
  // "_id": "5e959250808d6d2fe6b56eda",
  // "author": "鸢媛",
  // "category": "Girl",
  // "createdAt": "2020-05-25 08:00:00",
  // "desc": "与其安慰自己平凡可贵，\n不如拼尽全力活得漂亮。 ​ ​​​​",
  // "images": [
  // "http://gank.io/images/f4f6d68bf30147e1bdd4ddbc6ad7c2a2"
  // ],
  // "likeCounts": 4,
  // "publishedAt": "2020-05-25 08:00:00",
  // "stars": 1,
  // "title": "第96期",
  // "type": "Girl",
  // "url": "http://gank.io/images/f4f6d68bf30147e1bdd4ddbc6ad7c2a2",
  // "views": 7607
  // }

  @JsonKey(name: '_id')
  String id;
  String author;
  String category;
  String createAt;
  String desc;
  List<String> images;
  int likeCounts;
  String publishAt;
  int stars;
  String title;
  String type;
  String url;
  int views;

  GirlPhotoModel(
      this.id,
      this.author,
      this.category,
      this.createAt,
      this.desc,
      this.images,
      this.likeCounts,
      this.publishAt,
      this.stars,
      this.title,
      this.type,
      this.url,
      this.views);

  factory GirlPhotoModel.fromJson(Map<String, dynamic> json) => _$GirlPhotoModelFromJson(json);

  Map<String, dynamic> toJson() => _$GirlPhotoModelToJson(this);
}