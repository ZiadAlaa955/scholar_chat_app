import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'hide_password_state.dart';

class HidePasswordCubit extends Cubit<HidePasswordState> {
  HidePasswordCubit() : super(HidePasswordInitial());
  showHidePassword(
      {required bool showPassword, required bool passwordObsecure}) {
    if (showPassword == true) {
      showPassword = false;
      passwordObsecure = true;
      emit(HidePasswordSuccessful());
    } else {
      showPassword = true;
      passwordObsecure = false;
      emit(HidePasswordFaliure());
    }
  }
}
