class LoggedUser {
  late final String usuario;
  late final String senha;
  LoggedUser({required this.usuario, required this.senha});
  LoggedUser.fromJson(Map<String, dynamic> json) {
    usuario = json['usuario'];
    senha = json['senha'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['usuario'] = this.usuario;
    data['senha'] = this.senha;
    return data;
  }
}
