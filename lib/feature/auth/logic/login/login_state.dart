abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {}

class LoginError extends LoginState {
   String? errorMassage;
   LoginError(this.errorMassage);
}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}