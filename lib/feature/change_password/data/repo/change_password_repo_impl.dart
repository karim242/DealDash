import 'package:dartz/dartz.dart';
import 'package:dealdash/core/cache_helper/cache_helper.dart';
import 'package:dealdash/core/network_helper/dio_helper.dart.dart';
import 'package:dealdash/feature/change_password/data/model/password_model.dart';
import 'package:dealdash/feature/change_password/data/repo/change_password_repo.dart';

class ChangePasswordRepoImpl extends ChangePasswordRepo{
  final ApiService apiService;
  ChangePasswordRepoImpl({required this.apiService});
  @override
  Future<Either<String, String>> changePassword(PasswordModel password)  async {
    try {
      final token = await SecureCacheHelper.getToken();

      final response = await apiService.post( 
        endpoint: '/api/auth/change-password',
        data: {
        "current_password": password.oldPassword,
        "new_password": password.newPassword,
        "new_password_confirmation": password.confirmPassword,
      }, token: token
        
       );
      if (response.containsKey('message')) {
        return right(response['message']);
      } else {
        return left(response.toString());
      }
    } catch (error) {
      return left("Failed to change password: $error");
    }
  }


}