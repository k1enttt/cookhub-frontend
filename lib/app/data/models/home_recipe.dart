import 'dart:convert';

import 'package:cookhub_frontend/core/constants/image_strings.dart';

List<HomeModel> recipesFromMap(String str) => List<HomeModel>.from(
      json.decode(str)["data"].map(
            (recipe) => HomeModel.fromMap(recipe),
          ),
    );

String recipesToMap(List<HomeModel> data) => json.encode(
      List<dynamic>.from(
        data.map(
          (item) => item.toMap(),
        ),
      ),
    );

class HomeModel {
  HomeModel({
    required this.imageUrl,
    required this.title,
    required this.avatarUrl,
    required this.name,
    required this.time,
    required this.rate,
  });
  late final String imageUrl;
  late final String title;
  late final String avatarUrl;
  late final String name;
  late final int time;
  late final String rate;

  factory HomeModel.fromMap(Map<String, dynamic> json) => HomeModel(
        imageUrl: json["cover_url"] ?? '',
        title: json["title"] ?? '',
        avatarUrl: json["author"]["avatar_url"] ?? '',
        name: json["author"]["name"] ?? '',
        time: json["cook_time"] ?? '',
        rate: json["rating"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "imageUrl": imageUrl,
        "title": title,
        "avatarUrl": avatarUrl,
        "name": name,
        "time": time,
        "rate": rate,
      };
}
