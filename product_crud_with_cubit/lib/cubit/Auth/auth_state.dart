part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class UserAccess extends AuthState {
  final bool isLogged;
  UserAccess(this.isLogged);
}
