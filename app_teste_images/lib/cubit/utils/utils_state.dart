part of 'utils_cubit.dart';

@immutable
abstract class UtilsState {}

class UtilsInitial extends UtilsState {}

class ShowSnackBarMessage extends UtilsState {
  final String message;

  ShowSnackBarMessage({required this.message});
}
