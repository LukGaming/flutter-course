import 'package:real_free_auth/models/requests/user_login_request.dart';
import 'package:real_free_auth/models/requests/user_register_request.dart';
import 'package:real_free_auth/models/storage/user.dart';
import 'package:real_free_auth/repositories/base_repository.dart';

class UserInfraStructure {
  Future<Object?>? registerUser(UserRegisterRequest userRegisterRequest) {
    var baseRepository = BaseRepository();
    var response = baseRepository.post(userRegisterRequest.toJson(), "usuario");
    return response;
  }

  Future<bool> login(LoginRequest loginRequest) async {
    var baseRepository = BaseRepository();
    var response = await baseRepository.post(
      loginRequest.toJson(),
      "autenticacao/autenticar",
    );
    if (response["sucesso"] == false) return false;
    LoggedUser loggedUser = LoggedUser.fromJson(
      response["dados"]["usuarioLogado"],
    );
    loggedUser.toJson().forEach((key, value) {
      BaseRepository.setItemStorage(key, value.toString());
    });
    return true;
  }

  Future<bool> verifyIfUserIsLogged() async {
    var response = await BaseRepository.getItemStorage("idDoUsuario");
    if (response == null) return false;
    return true;
  }

  Future<bool> logout() async {
    var getUserFromStorage = await getLoggedUser();
    print(getUserFromStorage);

    return true;
  }

  Future<LoggedUser> getLoggedUser() async {
    var loggedUser = LoggedUser(
      idDoUsuario:
          int.parse(BaseRepository.getItemStorage("idDoUsuario") as String),
      nomeDoUsuario: BaseRepository.getItemStorage('nomeDoUsuario') as String,
      emailDoUsuario: BaseRepository.getItemStorage('emailDoUsuario') as String,
      telefoneDoUsuario:
          BaseRepository.getItemStorage('telefoneDoUsuario') as String,
      statusDoUsuario:
          BaseRepository.getItemStorage('statusDoUsuario') as String,
      statusValidacaoConta:
          BaseRepository.getItemStorage('statusValidacaoConta') as String,
      tipoDoUsuario: BaseRepository.getItemStorage('tipoDoUsuario') as String,
      perfilDoUsuario:
          BaseRepository.getItemStorage('perfilDoUsuario') as String,
      emailTemporario:
          BaseRepository.getItemStorage('emailTemporario') as String,
      token: BaseRepository.getItemStorage('token') as String,
      dataExpiracaoToken:
          BaseRepository.getItemStorage('dataExpiracaoToken') as String,
      refreshToken: BaseRepository.getItemStorage('refreshToken') as String,
    );
    print(loggedUser);
    return loggedUser;
  }
}
