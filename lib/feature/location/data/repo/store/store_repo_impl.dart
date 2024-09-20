import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/cache_helper/cache_helper.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/network_helper/dio_helper.dart.dart';
import '../../model/store_model.dart';
import 'store_repo.dart';

class StoreRepositoryImpl implements StoreRepository {
  final ApiService apiService;

  StoreRepositoryImpl(this.apiService);

  @override
  Future<Either<Failure, List<StoreModel>>> getNearbyStores(
      double? lat, double? long) async {
    try {
      // استرجاع الـ token من CacheHelper
      String? token = CacheHelper.getToken(key: 'auth_token');

      if (token != null) {
        // طلب البيانات باستخدام الـ token
        final data = await apiService.getData(
          endpoint: '/api/v1/user/stores/nearby-stores',
          query: {
            'latitude': 31.39327333,
            'longitude': 31.03190087,
            'radius': 10,
          },
          token: token,
        );

        // تحويل البيانات إلى قائمة من StoreModel
        final List<StoreModel> stores = (data as List)
            .map((storeJson) => StoreModel.fromJson(storeJson))
            .toList();

        return Right(stores);
      } else {
        // إذا لم يتم العثور على الـ token
        return Left(ServerFailure('Token is missing'));
      }
    } on DioError catch (e) {
      return Left(ServerFailure(e.message.toString()));
    } catch (e) {
      return Left(ServerFailure('Unexpected error occurred'));
    }
  }
}