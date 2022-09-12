part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoggedUserState extends AuthState {
  final LoggedUser loggedUser;
  LoggedUserState({required this.loggedUser});
}
