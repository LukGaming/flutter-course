class Pokemon {
  late int id;
  late String name;
  late String imageSrc;
  late String types;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageSrc,
    required this.types,
  });
  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageSrc = json['image_src'];
    types = json['types'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image_src'] = this.imageSrc;
    data['types'] = this.types;
    return data;
  }
}
