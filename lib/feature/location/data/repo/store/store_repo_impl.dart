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
  Future<Either<ServerException, List<StoreModel>>> getNearbyStores(
      double? lat, double? long) async {
    try {
      String? token = CacheHelper.getToken();

      if (token != null) {
        // طلب البيانات باستخدام الـ token
        final data = await apiService.getData(
          endpoint: '/api/v1/user/stores/nearby-stores',
          query: {
            'latitude': lat,
            'longitude': long,
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
        return Left(ServerException(
            errorModel: ErrorModel(message: 'Token is missing')));
      }
    } on DioException catch (e) {
      // التعامل مع DioException باستخدام handelDioException
      handelDioException(e);
      return Left(ServerException(
          errorModel: ErrorModel.fromJson(e.response?.data)));
    } catch (e) {
      // التعامل مع أي خطأ غير متوقع
      return Left(ServerException(
          errorModel: ErrorModel(message: 'Unexpected error occurred')));
    }
  }
}