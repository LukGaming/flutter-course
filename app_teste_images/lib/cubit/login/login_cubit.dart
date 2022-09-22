import 'package:app_teste_images/cubit/utils/utils_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
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
    emit(LoggedUserState(
      userName: usuario,
      password: senha,
    ));
    utilsCubit.mostrarPrint(message: "Logado com sucesso");
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
}
