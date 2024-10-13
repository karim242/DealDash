abstract class PasswordState {}

class PasswordInitial extends PasswordState {}

class PasswordLoading extends PasswordState {}

class PasswordSuccess extends PasswordState {
  final String message;
  PasswordSuccess(this.message);
}

class PasswordFailure extends PasswordState {
  final String error;
  PasswordFailure(this.error);
}