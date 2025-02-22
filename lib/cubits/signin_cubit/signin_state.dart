part of 'signin_cubit.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninSuccess extends SigninState {}

final class SigninLoading extends SigninState {}

final class SigninFaliure extends SigninState {
  final String errorMessage;

  SigninFaliure({required this.errorMessage});
}
