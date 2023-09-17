import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailuer(errMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(
            LoginFailuer(errMessage: 'Wrong password provided for that user.'));
      }
    } catch (e) {
      emit(LoginFailuer(errMessage: 'Failed with Error'));
    }
  }

  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(RegisteLoading());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(RegisteSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisteFailuer(errMessage: 'The password provided is too weak'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisteFailuer(
            errMessage: 'The account already exists for that email.'));
      }
    } catch (e) {
      emit(RegisteFailuer(errMessage: 'Failed with Error'));
    }
  }
}
