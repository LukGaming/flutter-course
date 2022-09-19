class User {
  int? id;
  String? name;
  int? idade;

  User({required this.id, required this.name, required this.idade});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    idade = json['idade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['idade'] = this.idade;
    return data;
  }
}
