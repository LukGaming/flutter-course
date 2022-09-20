part of 'utils_cubit.dart';

@immutable
abstract class UtilsState {}

class UtilsInitial extends UtilsState {}

class ShowSnackBar extends UtilsState {
  final String message;
  ShowSnackBar({required this.message});
}

class ShowAlertPopUp extends UtilsState {
  final String title;
  final String message;
  ShowAlertPopUp({required this.title, required this.message});
}
