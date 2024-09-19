import '../../model/places_model.dart';

abstract class PlacesRepository {
  Future<List<Place>> getNearbyPlaces(double lat, double lng);
}