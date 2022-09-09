class Product {
  String? name;
  String? description;
  double? price;

  Product.empty({
    name = "",
    description = "",
    price = 0.0,
  });
  Product({this.name, this.description, this.price});
  Product copyWith(String? name, String? description, double? price) {
    return Product(
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
    );
  }

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    price = json['price'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    return data;
  }
}
