import 'dart:ffi';

class Product {
  late int id;
  late String name;
  late String description;
  late double price;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
    description = json['description'] as String;
    price = double.parse(json['price'] as String);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    return data;
  }
}
