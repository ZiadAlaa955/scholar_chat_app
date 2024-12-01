part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SigninSuccess extends AuthState {}

final class SigninLoading extends AuthState {}

final class SigninFaliure extends AuthState {
  final String errorMessage;

  SigninFaliure({required this.errorMessage});
}

final class SignupLoading extends AuthState {}

final class SignupSuccess extends AuthState {}

final class SignupFaliure extends AuthState {
  final String errorMessage;

  SignupFaliure({required this.errorMessage});
}
