part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class RegistrandoUsuario extends LoginState {}

class LoggedUserState extends LoginState {
  final String userName;
  final String password;

  LoggedUserState({
    required this.userName,
    required this.password,
  });
}
