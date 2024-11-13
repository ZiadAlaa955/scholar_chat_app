part of 'hide_password_cubit.dart';

@immutable
sealed class HidePasswordState {}

final class HidePasswordInitial extends HidePasswordState {}

final class HidePasswordSuccessful extends HidePasswordState {}

final class HidePasswordFaliure extends HidePasswordState {}
