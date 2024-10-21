import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';

part 'auth_states.dart';

class AuthBloc extends Bloc<AuthEvent, authState> {
  AuthBloc() : super(AuthInitial()) {

    // @override
    // void onTransition(Transition<AuthEvent,authState>transition){
    //   super.onTransition(transition);
    //   print(transition);
    // }
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoading());
        try {
          UserCredential users = await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: event.email, password: event.password);
          emit(LoginSucess() );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            emit(LoginFalier(errorMassage: e.toString()) );
          } else if (e.code == 'Wrong-password') {
            emit(LoginFalier(errorMassage: e.toString()));
          }
        } catch (e) {
          emit(LoginFalier(errorMassage: 'someThing went wrong'));
        }
      }
      else if (event is RegisterEvent) {
        emit(RegisterLoading());
        try {
          UserCredential users = await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: event.email, password: event.password);
          emit(RegisterSucess());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            emit(RegisterFalier(errorMassage: 'weak-password'));
          } else if (e.code == 'email-already-in-use') {
            emit(RegisterFalier(errorMassage: 'email-is-already-in-use'));
          }
        } catch (e) {
          emit(RegisterFalier(
              errorMassage: 'There was an error please try again'));
        }
      }
    });
  }
}
