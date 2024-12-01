import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is SignInEvent) {
        emit(SigninLoading());
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          emit(SigninSuccess());
        } on FirebaseAuthException catch (e) {
          switch (e.code.toString()) {
            case 'invalid-email':
              emit(SigninFaliure(errorMessage: 'Invalid email address'));
              break;
            case 'wrong-password':
              emit(SigninFaliure(errorMessage: 'Incorrect password'));
              break;
            case 'user-not-found':
              emit(SigninFaliure(errorMessage: 'User not found'));
              break;
            case 'user-disabled':
              emit(SigninFaliure(errorMessage: 'User account disabled'));
              break;
            default:
              emit(SigninFaliure(
                  errorMessage: e.code)); // Handle unexpected codes
          }
        } on Exception catch (e) {
          emit(SigninFaliure(
              errorMessage: 'Something went wrong: ${e.toString()}'));
        }
      } else if (event is SignUpEvent) {
        emit(SignupLoading());
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
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
    });
  }
}
