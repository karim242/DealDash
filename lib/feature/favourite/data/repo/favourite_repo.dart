
import '../model/favourite_model.dart';

abstract class FavouriteRepo {
  Future<Map<String, dynamic>> addFavourite(String storeId);
  Future<Map<String, dynamic>> removeFavourite(String storeId);
  Future<FavoriteStoresResponse> getFavoriteStores();
}