import 'package:dartz/dartz.dart';
import 'package:dealdash/core/cache_helper/cache_helper.dart';
import 'package:dealdash/core/error/error_model.dart';
import 'package:dealdash/core/network_helper/dio_helper.dart.dart';
import 'package:dealdash/feature/favourite/data/model/favourite_model.dart';

import 'favourite_repo.dart';

class FavouriteRepoImpl extends FavouriteRepo {
  final ApiService apiService;

  FavouriteRepoImpl({
    required this.apiService,
  });
  @override
  Future<Map<String, dynamic>> addFavourite(String storeId) async {
    String? token = await SecureCacheHelper.getToken();

    try {
      final response = await apiService.post(
        endpoint: '/api/v1/user/stores/$storeId/favorite',
        data: {},
        token: token,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> removeFavourite(String storeId) async {
    String? token = await SecureCacheHelper.getToken();

    try {
      final response = await apiService.post(
        endpoint: '/api/v1/user/stores/$storeId/favorite',
        data: {},
        token: token,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override

  Future<Either<ErrorResponse, FavoriteStoresResponse>> getFavoriteStores() async {
    String? token =await SecureCacheHelper.getToken();
    try {
      final response = await apiService.getData(
        endpoint: '/api/v1/user/stores/favorite-stores?per_page=15&page=1',
        token: token,
      );

      if (response['success'] == true) {
        return Right(FavoriteStoresResponse.fromJson(response));
      } else {
        return Left(ErrorResponse.fromJson(response));
      }
    } catch (e) {
      return Left(ErrorResponse(message: 'An error occurred: $e'));
    }
  }

}
