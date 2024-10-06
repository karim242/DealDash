
import 'package:dartz/dartz.dart';
import 'package:dealdash/core/error/error_model.dart';

import '../model/favourite_model.dart';

abstract class FavouriteRepo {
  Future<Map<String, dynamic>> addFavourite(String storeId);
  Future<Map<String, dynamic>> removeFavourite(String storeId);
  Future<Either<ErrorResponse, FavoriteStoresResponse>> getFavoriteStores();
}