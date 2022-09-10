import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:product_crud_with_cubit/cubit/Utils/utils_cubit.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final UtilsCubit utilsCubit;
  AuthCubit({required this.utilsCubit}) : super(UserAccess(false));
  void logUser() {
    final currentState = state;
    if (currentState is UserAccess) {
      currentState.isLogged;
      emit(UserAccess(!currentState.isLogged));
    }
  }
}
