class User {
  final int? id;
  final String? name;
  final String? mail;

  User({
    this.id,
    this.name,
    this.mail,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      mail: json['mail'] as String,
    );
  }
}
