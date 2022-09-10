part of 'utils_cubit.dart';

@immutable
abstract class UtilsState {}

class Loading extends UtilsState {}

class ShowDialog extends UtilsState {
  final String message;
  ShowDialog(this.message);
}
