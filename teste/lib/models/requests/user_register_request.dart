class UserRegisterRequest {
  String? nomeDoUsuario;
  String? emailDoUsuario;
  String? telefoneDoUsuario;
  String? senhaDoUsuario;
  String? responseServer;
  bool? telefoneDoUsuarioEWhatsapp;
  String? ddiTelefoneDoUsuario;
  String? paisDDIDoTelefoneDoUsuario;

  UserRegisterRequest({
    this.nomeDoUsuario,
    this.emailDoUsuario,
    this.telefoneDoUsuario,
    this.senhaDoUsuario,
    this.responseServer,
    this.telefoneDoUsuarioEWhatsapp,
    this.ddiTelefoneDoUsuario,
    this.paisDDIDoTelefoneDoUsuario,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['nomeDoUsuario'] = this.nomeDoUsuario as String;
    data['emailDoUsuario'] = this.emailDoUsuario as String;
    data['telefoneDoUsuario'] = this.telefoneDoUsuario as String;
    data['senhaDoUsuario'] = this.senhaDoUsuario as String;
    data['responseServer'] = this.responseServer as String;
    data['telefoneDoUsuarioEWhatsapp'] =
        this.telefoneDoUsuarioEWhatsapp as bool;
    data['ddiTelefoneDoUsuario'] = this.ddiTelefoneDoUsuario as String;
    data['paisDDIDoTelefoneDoUsuario'] =
        this.paisDDIDoTelefoneDoUsuario as String;
    return data;
  }
}
