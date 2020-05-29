import 'dart:convert';

import 'package:cactus_app/domain/entities/blog_top.dart';
import 'package:firebase_database/firebase_database.dart';

class BlogTopModel extends BlogTop {
  String id;
  String imgPath;
  String subTitle;
  String title;

  BlogTopModel({this.id, this.imgPath, this.subTitle, this.title})
      : super(id: id, imgPath: imgPath, subTitle: subTitle, title: title);

  factory BlogTopModel.fromJsonMap(Map<String, dynamic> map) {
    return BlogTopModel(id: map["id"], imgPath: map["img_path"], subTitle: map["sub_title"], title: map["title"]);
  }

  Map<String, BlogTopModel> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['img_path'] = imgPath;
    data['sub_title'] = subTitle;
    data['title'] = title;
    return data;
  }

  static List<BlogTopModel> fromJsonToList(DataSnapshot snapshot) {
    final jsonE = json.encode(snapshot.value);
    final jsonR = json.decode(jsonE);
    return (jsonR as List).map((i) => BlogTopModel.fromJsonMap(i)).cast<BlogTopModel>().toList();
  }

  @override
  String toString() {
    return 'BlogTopModel{id: $id, imgPath: $imgPath, subTitle: $subTitle, title: $title}';
  }
}
