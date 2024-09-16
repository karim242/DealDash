import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/network_helper/dio_helper.dart.dart';
import '../../model/store_model.dart';
import 'store_repo.dart';

class StoreRepositoryImpl implements StoreRepository {
  final ApiService apiService;

  StoreRepositoryImpl(this.apiService);

  @override
  Future<Either<Failure, List<StoreModel>>> getNearbyStores(double? lat , double? long) async {
    try {
      final data = await apiService.getData(endpoint: '/api/v1/user/stores/nearby-stores', 
      query: {
        'latitude': lat,
        'longitude': long,
        'radius': 10,
      },
      token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2RlYWxkYXNoLWRlbW8tYTJlYzg1MjhiMmY0Lmhlcm9rdWFwcC5jb20vIiwiYXVkIjoiaHR0cHM6Ly9kZWFsZGFzaC1kZW1vLWEyZWM4NTI4YjJmNC5oZXJva3VhcHAuY29tLyIsImp0aSI6IjFhOGJiNTUyYmE4MDZiM2M3NzVmMGU2YTU3ZTRmZWU3IiwiaWF0IjoxNzI2Mzk2NDY2LjA2MTEzNiwibmJmIjoxNzI2Mzk2NDY2LjA2MTEzOCwiZXhwIjoxNzI2NDAwMDY2LjA2MTEzOSwidWlkIjoyfQ.HhoP0KpW6hQONhooSYarPlz7VMUk4C4DON57nnxwzAE'
      );
       final List<StoreModel> stores = (data)
          .map((storeJson) => StoreModel.fromJson(storeJson))
          .toList();
      print(stores);
          // .map((storeJson) => Store.fromJson(storeJson))
          // .toList();
      return Right(stores);
    } on DioError catch (e) {
      return Left(ServerFailure(e.message.toString()));
    } catch (e) {
      return Left(ServerFailure('Unexpected error occurred'));
    }
  }
}
