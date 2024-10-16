
import 'package:dealdash/feature/auth/data/repo/auth_repo.dart';
import 'package:dealdash/feature/auth/presentation/cubit/logout/logout_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 //create  cubit

class LogoutCubit extends Cubit<LogoutState> {
  final AuthRepository apiServes;

  LogoutCubit(this.apiServes) : super(LogoutInitial());
 
 Future<void> logOut() async {
    emit(LogoutLoading());
  
  try{
    await apiServes.logOut();
    emit(LogoutSuccess());
  }catch (e) {
    emit(LogoutFailure('An unexpected error occurred'));
  }
 }
}