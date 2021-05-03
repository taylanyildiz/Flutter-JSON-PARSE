import 'package:flutter_json_exam/models/user_model.dart';

class ComplexUser {
  final int? success;
  final List<User>? user;

  ComplexUser({
    this.success,
    this.user,
  });

  factory ComplexUser.fromJson(Map<String, dynamic> json) {
    final users = (json['users'] as List).map((e) => User.fromJson(e)).toList();
    return ComplexUser(
      success: json['success'],
      user: users,
    );
  }
}
