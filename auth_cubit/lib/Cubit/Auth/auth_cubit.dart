import 'package:auth_cubit/Cubit/Utils/utils_cubit.dart';
import 'package:auth_cubit/data/models/logged_user.dart';
import 'package:auth_cubit/data/models/login_request.dart';
import 'package:auth_cubit/data/repositories/base_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends HydratedBloc<AuthCubit, AuthState> {
  final UtilsCubit utilsCubit;
  AuthCubit({required this.utilsCubit}) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    var baseRepository = BaseRespository();
    LoginRequest loginRequest =
        LoginRequest(emailDoUsuario: email, senhaDoUsuario: password);
    var response = await baseRepository.postRequest(
        "autenticacao/autenticar", loginRequest);
    if (response["sucesso"] == true) {
      emit(
        UserLoggedState(
          loggedUser: LoggedUser.fromJson(response["dados"]["usuarioLogado"]),
        ),
      );
      utilsCubit.showSnackBar("Logado com sucesso!");
    }
  }

  void showUserId() {
    var currentState = state;
    if (currentState is UserLoggedState) {
      print(currentState.loggedUser.idDoUsuario);
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
