import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpLoading());

  Future<void> SignupUser(
      {required String email, required String password}) async {
    emit(SignUpLoading());
    try {
      UserCredential users = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(SignUpSucess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignUpFalier(errorMassage: e.toString()));
      } else if (e.code == 'Wrong-password') {
        emit(SignUpFalier(errorMassage: e.toString()));
      }
    } catch (e) {
      emit(SignUpFalier(errorMassage: 'someThing went wrong'));
    }
  }
}
