part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginFaliure extends LoginState {
  final String errorMessage;

  LoginFaliure({required this.errorMessage});
}
