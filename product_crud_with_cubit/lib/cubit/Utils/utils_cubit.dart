import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'utils_state.dart';

class UtilsCubit extends Cubit<UtilsState> {
  UtilsCubit() : super(Loading());
  void showDialog(String message) {
    emit(ShowDialog(message));
  }
}
