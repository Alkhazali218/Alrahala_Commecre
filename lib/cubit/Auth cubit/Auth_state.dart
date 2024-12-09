abstract class AuthState {}

// ignore: camel_case_types
class initialState extends AuthState {}

// ignore: camel_case_types
class loadingState extends AuthState {}

// ignore: camel_case_types
class sucessState extends AuthState {}

// ignore: camel_case_types
class errorState extends AuthState {
  String message;

  errorState({required this.message});
}
