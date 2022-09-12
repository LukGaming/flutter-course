class LoginRequest {
  late final String emailDoUsuario;
  late final String senhaDoUsuario;

  LoginRequest({required this.emailDoUsuario, required this.senhaDoUsuario});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    emailDoUsuario = json['emailDoUsuario'];
    senhaDoUsuario = json['senhaDoUsuario'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emailDoUsuario'] = this.emailDoUsuario;
    data['senhaDoUsuario'] = this.senhaDoUsuario;
    return data;
  }
}
