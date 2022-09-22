import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'utils_state.dart';

class UtilsCubit extends Cubit<UtilsState> {
  UtilsCubit() : super(UtilsInitial());
  void mostrarPrint({required String message}) {
    emit(ShowSnackBarMessage(message: message));
  }
}
