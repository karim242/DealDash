import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/cache_helper/cache_helper.dart';
import '../../../../../core/error/error_model.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/network_helper/dio_helper.dart.dart';
import '../../model/store_model.dart';
import 'store_repo.dart';
class StoreRepositoryImpl implements StoreRepository {
  final ApiService apiService;

  StoreRepositoryImpl(this.apiService);

  @override
  Future<Either<ServerException, StoreModel>> getNearbyStores(
      double? lat, double? long) async {
    try {
      String? token = CacheHelper.getToken();

      final data = await apiService.getData(
        endpoint: '/api/v1/user/stores/nearby-stores',
        query: {
          'latitude': lat,  
          'longitude': long,
          'radius': 5000,       
        },
        token: token,
      );

      final StoreModel storesResponse = StoreModel.fromJson(data);

      print(storesResponse.success);
      print(storesResponse.message);
      print(storesResponse.data);

      return Right(storesResponse);
      
    } on DioException catch (e) {
      handelDioException(e);
      return Left(ServerException(
          errorModel: ErrorResponse.fromJson(e.response?.data)));
    }
  }
}