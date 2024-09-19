import 'package:dealdash/core/resources/strings_manger/strings_manager.dart';
import 'package:dio/dio.dart';

import '../../model/places_model.dart';
import 'places_repo.dart';

class PlacesRepositoryImpl implements PlacesRepository {
  final Dio dio;

  PlacesRepositoryImpl({required this.dio});

  @override
  Future<List<Place>> getNearbyPlaces(double lat, double lng) async {
   
    final String url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=stores&location=$lat,$lng&radius=100&type=مولاتمحلات ملابس واجهزه كهربائي&key=${AppStrings.apiKey}';

    try {
      final response = await dio.get(url);
    
      if (response.statusCode == 200) {
        List results = response.data['results'];
          print(results);
        return results.map((placeJson) => Place.fromJson(placeJson)).toList();
      } else {
        throw Exception('Failed to load places');
      }
    } catch (e) {
      throw Exception('Error fetching nearby places: $e');
    }
  }
}