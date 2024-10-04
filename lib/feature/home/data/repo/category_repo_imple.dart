import 'package:dartz/dartz.dart';
import 'package:dealdash/core/cache_helper/cache_helper.dart';
import 'package:dealdash/core/error/error_model.dart';
import 'package:dealdash/core/error/failure.dart';
import 'package:dealdash/feature/home/data/model/category_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/network_helper/dio_helper.dart.dart';
import 'category_repo.dart';
class CategoryRepoImple extends CategoryRepository {
  final ApiService apiService;

  CategoryRepoImple(this.apiService);

  @override
  Future<Either<ServerException, CategoryModel>> fetchCategories() async {
    try {
      String? token = CacheHelper.getToken();

      final result = await apiService.getData(
        endpoint: '/api/v1/user/categories/list-all',
        token: token,
      );

      if (result['data'] != null) {
        final categoryResponse = CategoryModel.fromJson(result);

        print(categoryResponse);

        return Right(categoryResponse);
      } else {
        return Left(ServerException(
            errorModel: ErrorResponse(message: "No data found")));
      }
    } on DioException catch (e) {
      handelDioException(e);
      return Left(ServerException(
          errorModel: ErrorResponse.fromJson(e.response?.data)));
    }
  }
}