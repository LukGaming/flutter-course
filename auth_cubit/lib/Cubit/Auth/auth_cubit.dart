import 'package:auth_cubit/Cubit/Utils/utils_cubit.dart';
import 'package:auth_cubit/constants/pop_up_messages.dart';
import 'package:auth_cubit/data/models/logged_user.dart';
import 'package:auth_cubit/data/models/login_request.dart';
import 'package:auth_cubit/data/models/register_user_request.dart';
import 'package:auth_cubit/data/repositories/base_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends HydratedBloc<AuthCubit, AuthState> {
  final UtilsCubit utilsCubit;
  AuthCubit({
    required this.utilsCubit,
  }) : super(AuthInitial());

  void registerUser({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    UserRegisterRequest userRegisterRequest = UserRegisterRequest(
      nomeDoUsuario: name,
      emailDoUsuario: email,
      telefoneDoUsuario: phone,
      senhaDoUsuario: password,
      responseServer: "",
      telefoneDoUsuarioEWhatsapp: true,
      ddiTelefoneDoUsuario: "64",
      paisDDIDoTelefoneDoUsuario: "+55",
    );
    utilsCubit.startLoading();
    var baseRepository = BaseRespository();
    var response =
        await baseRepository.postRequest("usuario", userRegisterRequest);
    utilsCubit.stopLoading();
    goToLoginView();
    if (response["sucesso"] == true) {
      utilsCubit.showAlertPopUp(
        "Sucesso!",
        user_created_successifuly,
      );
    } else {
      utilsCubit.showAlertPopUp(
        email_or_password_wrong,
        response["mensagem"],
      );
    }
  }

  void closePopup(value) {
    utilsCubit.closePopUp();
    // if (state is UserRegister) goToLoginView();
  }

  void goToRegisterView() {
    emit(UserRegister());
  }

  void goToLoginView() {
    emit(AuthInitial());
  }

  Future<void> login(String email, String password) async {
    LoginRequest loginRequest =
        LoginRequest(emailDoUsuario: email, senhaDoUsuario: password);
    var baseRepository = BaseRespository();
    var response = await baseRepository.postRequest(
        "autenticacao/autenticar", loginRequest);
    if (response["sucesso"] == true) {
      emit(
        UserLoggedState(
          loggedUser: LoggedUser.fromJson(response["dados"]["usuarioLogado"]),
        ),
      );
      utilsCubit.showSnackBar("Logado com sucesso!");
    } else {
      utilsCubit.showAlertPopUp(email_or_password_wrong, response["mensagem"]);
    }
  }

  void showUserId() {
    var currentState = state;
    if (currentState is UserLoggedState) {
      print(currentState.loggedUser.token);
    }
  }

  void logout() {
    HydratedBloc.storage.clear();
    utilsCubit.showSnackBar(
      "Deslogado com sucesso!",
    );
    emit(AuthInitial());
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return UserLoggedState(
      loggedUser: LoggedUser.fromJson(json),
    );
  }

  @override
  Map<String, dynamic>? toJson(state) {
    if (state is UserLoggedState) {
      return {
        'idDoUsuario': state.loggedUser.idDoUsuario,
        'nomeDoUsuario': state.loggedUser.nomeDoUsuario,
        'emailDoUsuario': state.loggedUser.emailDoUsuario,
        'telefoneDoUsuario': state.loggedUser.telefoneDoUsuario,
        'statusDoUsuario': state.loggedUser.statusDoUsuario,
        'statusValidacaoConta': state.loggedUser.statusValidacaoConta,
        'tipoDoUsuario': state.loggedUser.tipoDoUsuario,
        'perfilDoUsuario': state.loggedUser.perfilDoUsuario,
        'emailTemporario': state.loggedUser.emailTemporario,
        'token': state.loggedUser.token,
        'dataExpiracaoToken': state.loggedUser.dataExpiracaoToken,
        'refreshToken': state.loggedUser.refreshToken,
        'dataExpiracaoRefreshToken': state.loggedUser.dataExpiracaoRefreshToken,
      };
    }
    return null;
  }
}
