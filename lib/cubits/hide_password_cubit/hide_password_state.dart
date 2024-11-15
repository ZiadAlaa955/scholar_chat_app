part of 'hide_password_cubit.dart';

@immutable
sealed class HidePasswordState {}

final class HidePasswordInitial extends HidePasswordState {}

final class HidePassword extends HidePasswordState {}

final class ShowPassword extends HidePasswordState {}
