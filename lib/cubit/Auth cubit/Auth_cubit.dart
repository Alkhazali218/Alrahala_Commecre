import 'package:alrahala_commecre/cubit/Auth%20cubit/Auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(initialState());

  Future<void> register(
      {required String email,
      required String password}) async {
    emit(loadingState());
    try {
      // ignore: unused_local_variable
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(sucessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(errorState(message: 'يوجد خطا في الايميل او كلمة السر'));
      } else if (e.code == 'email-already-in-use') {
        emit(errorState(message: 'الايميل مستخدم مسبقا'));
      }
    } catch (e) {
      emit(errorState(message:'{$e}'));
    }
  }

 Future<void> login({
  required String email,
  required String password,
}) async {
  emit(loadingState());
 try {
  // ignore: unused_local_variable
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password
  );
  emit(sucessState());
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    emit(errorState(message: 'لم يتم عثور على حساب, رجاءا قم بانشاء حساب '));
  } else if (e.code == 'wrong-password') {
    emit(errorState(message: 'لقد قمت بادخال بريد او كلمة سر خطا'));
  }else {
    emit(errorState(message: 'لقد قمت بادخال بريد او كلمة سر خطا'));
  }
}
}
}
