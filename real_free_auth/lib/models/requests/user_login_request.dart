class LoginRequest {
  late String emailDoUsuario;
  late String senhaDoUsuario;

  LoginRequest({
    required this.emailDoUsuario,
    required this.senhaDoUsuario,
  });

  LoginRequest.fromJson(Map<String, dynamic> json) {
    emailDoUsuario = json['emailDoUsuario'];
    senhaDoUsuario = json['senhaDoUsuario'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emailDoUsuario'] = this.emailDoUsuario as String;
    data['senhaDoUsuario'] = this.senhaDoUsuario as String;
    return data;
  }
}
