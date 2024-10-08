import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../../model/store_model.dart';

abstract class StoreRepository {
  Future<Either<ServerException, StoreModel>> getNearbyStores(double? lat , double? long);
}