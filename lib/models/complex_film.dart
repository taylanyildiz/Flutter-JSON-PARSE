import 'package:flutter_json_exam/models/film_model.dart';

class ComplexFilm {
  final int? success;
  final List<Film>? film;

  ComplexFilm({
    this.success,
    this.film,
  });

  factory ComplexFilm.fromJson(Map<String, dynamic> json) {
    final films = (json['films'] as List).map((e) => Film.fromJson(e)).toList();
    return ComplexFilm(
      success: json['success'],
      film: films,
    );
  }
}
