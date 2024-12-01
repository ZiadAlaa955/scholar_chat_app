part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginFaliure extends AuthState {
  final String errorMessage;

  LoginFaliure({required this.errorMessage});
}

final class SignupLoading extends AuthState {}

final class SignupSuccess extends AuthState {}

final class SignupFaliure extends AuthState {
  final String errorMessage;

  SignupFaliure({required this.errorMessage});
}
