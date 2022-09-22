import 'package:app_teste_images/cubit/utils/utils_cubit.dart';
import 'package:app_teste_images/data/models/logged_user.dart';
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends HydratedBloc<LoginCubit, LoginState> {
  final UtilsCubit utilsCubit;
  LoginCubit({required this.utilsCubit}) : super(LoginInitial());

  void logarUsuario({
    required String usuario,
    required String senha,
  }) {
    //verificar se tem conexão com internet
    //ir no banco local e verificar senha
    //ir na api e verificar senha
    //retornar dados do usuário
    //alterar estado da aplicacao
    var loggedUser = LoggedUser(usuario: usuario, senha: senha);
    emit(LoggedUserState(loggedUser: loggedUser));
    utilsCubit.mostrarPrint(message: "Logado com sucesso");
  }

  void logout() {
    try {
      HydratedBloc.storage.clear();
      emit(LoginInitial());
      utilsCubit.mostrarPrint(message: "Deslogado com sucesso!");
    } catch (e) {
      utilsCubit.mostrarPrint(message: e.toString());
    }
  }

  void recuperarSenha({required String novaSenha}) {
    //salvar no banco local
    //ou  salvar na api
    //fechar a tela de recuperar senha
    //chamar o outro Cubit para mostrar uma mensagem na tela de que senha alterada
  }
  void irParaRegistrar() {
    emit(RegistrandoUsuario());
  }

  @override
  LoginState? fromJson(Map<String, dynamic> json) {
    return LoggedUserState(
      loggedUser: LoggedUser(usuario: json['usuario'], senha: json['senha']),
    );
  }

  @override
  Map<String, dynamic>? toJson(LoginState state) {
    if (state is LoggedUserState) {
      return {
        'usuario': state.loggedUser.usuario,
        'senha': state.loggedUser.senha,
      };
    }
  }
}
