class Product {
  int? id;
  String? name;
  String? description;
  int? price;
  int? categoryId;

  Product({
    required this.name,
    required this.description,
    required this.price,
  });
  Product.fromJson(Map<String, dynamic> json) {
    price = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    categoryId = json['categoryId'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['categoryId'] = this.categoryId;

    return data;
  }
}
