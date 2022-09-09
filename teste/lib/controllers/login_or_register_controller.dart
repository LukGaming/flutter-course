import 'package:real_free_auth/models/requests/user_register_request.dart';
import 'package:real_free_auth/repositories/user_repository.dart';

class LoginOrRegisterController {
  static Future<Object> register(
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
    var result = await UserRepository.registerUser(userRequest);
    return result;
  }

  static Future<Object> login(String email, String password) async {
    var result = await UserRepository.login(email, password);
    return result;
  }
}
