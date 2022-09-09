class ProductRequest {
  late int id;
  late String name;
  late String description;
  late String price;

  ProductRequest({
    required this.name,
    required this.description,
    required this.price,
  });

  ProductRequest.fromJson(Map<String, dynamic> json) {
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
