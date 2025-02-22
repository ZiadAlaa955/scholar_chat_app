import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
part 'auth_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  signUp({required String email, required String password}) async {
    emit(SignupLoading());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignupSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code.toString() == 'weak-password') {
        emit(SignupFaliure(errorMessage: 'The password is too weak'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignupFaliure(errorMessage: 'The account already exists'));
      } else {
        emit(SignupFaliure(errorMessage: e.toString()));
      }
    } on Exception catch (e) {
      emit(SignupFaliure(errorMessage: e.toString()));
    }
  }
}
