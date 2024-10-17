abstract class SignupState {
  const SignupState();
}

class SignupInitial extends SignupState {}

class SignupError extends SignupState {
  SignupError(this.errorMassage);
  String? errorMassage;
}

class SignupSuccess extends SignupState {}

class SignupLoading extends SignupState {}