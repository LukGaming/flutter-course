class Category {
  int id;
  String name;
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['categoryName'],
    );
  }
  Category({required this.id, required this.name});
}
