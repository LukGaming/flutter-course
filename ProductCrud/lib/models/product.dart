class Product {
  final int? id;
  final String name;
  final String description;
  final String price;
  final int categoryId;
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        categoryId: json['categoryId']);
  }
  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.categoryId});
}
