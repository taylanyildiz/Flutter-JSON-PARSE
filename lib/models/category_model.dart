class Category {
  final int? id;
  final String? name;

  Category({
    this.id,
    this.name,
  });

  factory Category.fromJason(Map<String, dynamic> json) => Category(
        id: json['id'],
        name: json['name'],
      );
}
