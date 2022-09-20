part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class UserLoggedState extends AuthState {
  final LoggedUser loggedUser;
  UserLoggedState({required this.loggedUser});
}

class UserRegister extends AuthState {}
