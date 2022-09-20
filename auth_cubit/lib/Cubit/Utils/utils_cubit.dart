import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'utils_state.dart';

class UtilsCubit extends Cubit<UtilsState> {
  UtilsCubit() : super(UtilsInitial());
  void startLoading() {
    emit(UtilsLoadingState());
  }

  void stopLoading() {
    emit(UtilsCloseLoadingState());
  }

  void showSnackBar(String message) {
    emit(
      ShowSnackBar(message: message),
    );
  }

  void showAlertPopUp(String title, String message) {
    emit(
      ShowAlertPopUp(
        title: title,
        message: message,
      ),
    );
  }

  void closePopUp() {
    emit(ClosePopUp());
  }
}
