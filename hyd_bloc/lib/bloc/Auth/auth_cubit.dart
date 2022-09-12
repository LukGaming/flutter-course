import 'package:bloc/bloc.dart';
import 'package:hyd_bloc/bloc/Utils/utils_cubit.dart';
import 'package:hyd_bloc/data/repositories/base_repository.dart';
import 'package:hyd_bloc/models/logged_user.dart';
import 'package:hyd_bloc/models/login_request.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends HydratedCubit<AuthState> {
  final UtilsCubit utilsCubit;
  AuthCubit({required this.utilsCubit}) : super(AuthInitial());
  Future<void> logUser(String email, String password) async {
    LoginRequest loginRequest =
        LoginRequest(emailDoUsuario: email, senhaDoUsuario: password);
    BaseRepository baseRepository = BaseRepository();
    var response = await baseRepository.postRequest(
      "autenticacao/autenticar",
      loginRequest.toJson(),
    );
    if (response["sucesso"] == false) {
      utilsCubit.showPopUp(
        "Falha ao logar",
        "Email ou senhas incorretos!",
      );
    } else {
      LoggedUser loggedUser =
          LoggedUser.fromJson(response["dados"]["usuarioLogado"]);
      emit(LoggedUserState(loggedUser: loggedUser));
    }
  }

  void logout() {
    HydratedBloc.storage.clear();
    utilsCubit.showSnackBar("Deslogado com sucesso!");
    emit(AuthInitial());
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    return LoggedUserState(
      loggedUser: LoggedUser.fromJson(json),
    );
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    if (state is LoggedUserState) {
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
