class LoggedUser {
  int? idDoUsuario;
  String? nomeDoUsuario;
  String? emailDoUsuario;
  String? telefoneDoUsuario;
  String? statusDoUsuario;
  String? statusValidacaoConta;
  String? tipoDoUsuario;
  String? perfilDoUsuario;
  String? emailTemporario;
  String? token;
  String? dataExpiracaoToken;
  String? refreshToken;
  String? dataExpiracaoRefreshToken;

  LoggedUser({
    required this.idDoUsuario,
    required this.nomeDoUsuario,
    required this.emailDoUsuario,
    required this.telefoneDoUsuario,
    required this.statusDoUsuario,
    required this.statusValidacaoConta,
    required this.tipoDoUsuario,
    required this.perfilDoUsuario,
    required this.emailTemporario,
    required this.token,
    required this.dataExpiracaoToken,
    required this.refreshToken,
    required this.dataExpiracaoRefreshToken,
  });

  LoggedUser.fromJson(Map<String, dynamic> json) {
    idDoUsuario = json['idDoUsuario'];
    nomeDoUsuario = json['nomeDoUsuario'];
    emailDoUsuario = json['emailDoUsuario'];
    telefoneDoUsuario = json['telefoneDoUsuario'];
    statusDoUsuario = json['statusDoUsuario'];
    statusValidacaoConta = json['statusValidacaoConta'];
    tipoDoUsuario = json['tipoDoUsuario'];
    perfilDoUsuario = json['perfilDoUsuario'];
    emailTemporario = json['emailTemporario'];
    token = json['token'];
    dataExpiracaoToken = json['dataExpiracaoToken'];
    refreshToken = json['refreshToken'];
    dataExpiracaoRefreshToken = json['dataExpiracaoRefreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idDoUsuario'] = this.idDoUsuario;
    data['nomeDoUsuario'] = this.nomeDoUsuario;
    data['emailDoUsuario'] = this.emailDoUsuario;
    data['telefoneDoUsuario'] = this.telefoneDoUsuario;
    data['statusDoUsuario'] = this.statusDoUsuario;
    data['statusValidacaoConta'] = this.statusValidacaoConta;
    data['tipoDoUsuario'] = this.tipoDoUsuario;
    data['perfilDoUsuario'] = this.perfilDoUsuario;
    data['emailTemporario'] = this.emailTemporario;
    data['token'] = this.token;
    data['dataExpiracaoToken'] = this.dataExpiracaoToken;
    data['refreshToken'] = this.refreshToken;
    data['dataExpiracaoRefreshToken'] = this.dataExpiracaoRefreshToken;
    return data;
  }
}
