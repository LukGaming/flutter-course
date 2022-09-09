import 'package:real_free_auth/infrastructure/user_infrastructure.dart';
import 'package:real_free_auth/models/requests/user_login_request.dart';
import 'package:real_free_auth/models/requests/user_register_request.dart';

class UserController {
  static Future<Object?> registerUser(
      String name, String email, String phone, String password) async {
    UserRegisterRequest userRequest = UserRegisterRequest(
      nomeDoUsuario: name,
      emailDoUsuario: email,
      telefoneDoUsuario: phone,
      senhaDoUsuario: password,
      responseServer: "",
      telefoneDoUsuarioEWhatsapp: true,
      ddiTelefoneDoUsuario: "64",
      paisDDIDoTelefoneDoUsuario: "+55",
    );
    var userInfrastructure = UserInfraStructure();
    var response = userInfrastructure.registerUser(userRequest);
    return response;
  }

  static Future<bool> login(String email, String password) async {
    var userLoginRequest = LoginRequest(
      emailDoUsuario: email,
      senhaDoUsuario: password,
    );
    var userInfrastructure = UserInfraStructure();
    var response = userInfrastructure.login(userLoginRequest);
    return response;
  }

  static Future<bool> verifyIfUserIsLogged() async {
    var userInfrastructure = UserInfraStructure();
    var response = userInfrastructure.verifyIfUserIsLogged();
    return response;
  }

  static Future<bool> logout() async {
    var userInfrastructure = UserInfraStructure();
    var response = userInfrastructure.logout();
    return response;
  }
}
