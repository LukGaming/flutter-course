class LoggedUser {
  late int idDoUsuario;
  late String nomeDoUsuario;
  late String emailDoUsuario;
  late String telefoneDoUsuario;
  late String statusDoUsuario;
  late String statusValidacaoConta;
  late String tipoDoUsuario;
  late String perfilDoUsuario;
  late String emailTemporario;
  late String token;
  late String dataExpiracaoToken;
  late String refreshToken;
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
    return data;
  }

  toJSONEncodable() {
    Map<String, dynamic> data = new Map();
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
    return data;
  }
}
