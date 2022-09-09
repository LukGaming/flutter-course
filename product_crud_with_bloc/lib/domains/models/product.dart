// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  late int id;
  late String name;
  late String description;
  late int price;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
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
