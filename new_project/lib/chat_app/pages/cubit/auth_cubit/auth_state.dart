part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

final class AuthInitial extends AuthState {}

class RegisteLoading extends AuthState {}

class RegisteSuccess extends AuthState {}

class RegisteFailuer extends AuthState {
  String errMessage;
  RegisteFailuer({required this.errMessage});
}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginFailuer extends AuthState {
  String errMessage;
  LoginFailuer({required this.errMessage});
}
