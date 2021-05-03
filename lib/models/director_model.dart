class Director {
  final int? id;
  final String? name;
  Director({
    this.id,
    this.name,
  });

  factory Director.fromJson(Map<String, dynamic> json) => Director(
        id: json['id'],
        name: json['name'],
      );
}
