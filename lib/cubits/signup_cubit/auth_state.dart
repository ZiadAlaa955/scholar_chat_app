part of 'auth_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {}

final class SignupFaliure extends SignupState {
  final String errorMessage;

  SignupFaliure({required this.errorMessage});
}
