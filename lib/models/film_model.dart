import 'package:flutter_json_exam/models/category_model.dart';
import 'package:flutter_json_exam/models/director_model.dart';

class Film {
  final int? id;
  final String? name;
  final String? img;
  final Director? director;
  final Category? category;
  Film({
    this.id,
    this.name,
    this.img,
    this.director,
    this.category,
  });

  factory Film.fromJson(Map<String, dynamic> json) => Film(
        id: json['id'],
        name: json['name'],
        img: json['img'],
        director: Director.fromJson(json['director']),
        category: Category.fromJason(json['category']),
      );
}
