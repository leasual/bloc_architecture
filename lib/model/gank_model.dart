import 'package:json_annotation/json_annotation.dart';

part 'gank_model.g.dart';

@JsonSerializable()
class GankListModel extends Object {
  final List<GankModel> gankModelList;

  GankListModel(this.gankModelList);

  //
  // factory GankListModel.fromJson(Map<String, dynamic> json) =>
  // _$GankListModelFromJson(json);

  factory GankListModel.fromJson(List<dynamic> parsedJson) {
    List<GankModel> photos = new List<GankModel>();
    photos = parsedJson.map((i) => GankModel.fromJson(i)).toList();

    return GankListModel(photos);
  }

  Map<String, dynamic> toJson() => _$GankListModelToJson(this);
}

@JsonSerializable()
class GankModel extends Object {
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
  String createdAt;
  String desc;
  List<String> images;
  int likeCounts;
  String publishAt;
  int stars;
  String title;
  String type;
  String url;
  int views;

  GankModel(
      this.id,
      this.author,
      this.category,
      this.createdAt,
      this.desc,
      this.images,
      this.likeCounts,
      this.publishAt,
      this.stars,
      this.title,
      this.type,
      this.url,
      this.views);

  factory GankModel.fromJson(Map<String, dynamic> json) =>
      _$GankModelFromJson(json);

  Map<String, dynamic> toJson() => _$GankModelToJson(this);
}
