  
  import 'package:dartz/dartz.dart';
import 'package:dealdash/feature/change_password/data/model/password_model.dart';

abstract class ChangePasswordRepo{
    Future<Either<String, String>> changePassword(PasswordModel password);
  }