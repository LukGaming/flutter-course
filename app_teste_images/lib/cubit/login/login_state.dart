part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class RegistrandoUsuario extends LoginState {}

class LoggedUserState extends LoginState {
  final LoggedUser loggedUser;
  LoggedUserState({required this.loggedUser});
}
