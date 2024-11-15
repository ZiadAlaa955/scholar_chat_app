import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  logIn({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      switch (e.code.toString()) {
        case 'invalid-email':
          emit(LoginFaliure(errorMessage: 'Invalid email address'));
          break;
        case 'wrong-password':
          emit(LoginFaliure(errorMessage: 'Incorrect password'));
          break;
        case 'user-not-found':
          emit(LoginFaliure(errorMessage: 'User not found'));
          break;
        case 'user-disabled':
          emit(LoginFaliure(errorMessage: 'User account disabled'));
          break;
        default:
          emit(LoginFaliure(errorMessage: e.code)); // Handle unexpected codes
      }
    } on Exception catch (e) {
      emit(LoginFaliure(errorMessage: 'Something went wrong: ${e.toString()}'));
    }
  }
}
