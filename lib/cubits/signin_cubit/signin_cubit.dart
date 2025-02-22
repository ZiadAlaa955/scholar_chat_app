import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInitial());

  signIn({required String email, required String password}) async {
    emit(SigninLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SigninSuccess());
    } on FirebaseAuthException catch (e) {
      switch (e.code.toString()) {
        case 'invalid-email':
          emit(
            SigninFaliure(
                errorMessage:
                    'Invalid email address. Please check your email and try again.'),
          );
          break;
        case 'wrong-password':
          emit(
            SigninFaliure(
                errorMessage: 'Incorrect password. Please try again.'),
          );
          break;
        case 'user-not-found':
          emit(
            SigninFaliure(
                errorMessage:
                    'No user found with this email. Please sign up first.'),
          );
          break;
        case 'user-disabled':
          emit(
            SigninFaliure(
                errorMessage:
                    'This account has been disabled. Please contact support.'),
          );
          break;
        case 'too-many-requests':
          emit(
            SigninFaliure(
                errorMessage: 'Too many requests. Please try again later.'),
          );
          break;
        case 'operation-not-allowed':
          emit(
            SigninFaliure(
                errorMessage:
                    'Sign-in method is not enabled. Contact support.'),
          );
          break;
        case 'network-request-failed':
          emit(
            SigninFaliure(
                errorMessage:
                    'Network error. Please check your internet connection.'),
          );
          break;
        default:
          emit(
            SigninFaliure(errorMessage: e.code.toString()),
          );
      }
    } on Exception catch (e) {
      emit(
        SigninFaliure(errorMessage: 'Something went wrong: ${e.toString()}'),
      );
    }
  }
}
