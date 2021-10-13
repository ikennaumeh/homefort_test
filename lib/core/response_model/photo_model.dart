// To parse this JSON data, do
//
//     final photoModel = photoModelFromJson(jsonString);

import 'dart:convert';

List<PhotoModel> photoModelFromJson(String str) => List<PhotoModel>.from(json.decode(str).map((x) => PhotoModel.fromJson(x)));

String photoModelToJson(List<PhotoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotoModel {
  PhotoModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };

  static Map<String, dynamic> toMap (PhotoModel photoModel) => {
    "albumId": photoModel.albumId,
    "id": photoModel.id,
    "title": photoModel.title,
    "url": photoModel.url,
    "thumbnailUrl": photoModel.thumbnailUrl,
  };

  static String encode (List<PhotoModel> photoModels) => json.encode(
    photoModels
         .map<Map<String, dynamic>>((item) => PhotoModel.toMap(item))
         .toList(),
  );

  static List<PhotoModel> decode(String photoModels) =>
      (json.decode(photoModels) as List<dynamic>)
        .map<PhotoModel>((item) => PhotoModel.fromJson(item))
         .toList();
}
