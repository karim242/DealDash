import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/places/places_repo.dart';
import 'places_state.dart';

class PlacesCubit extends Cubit<PlacesState> {
  final PlacesRepository placesRepository;

  PlacesCubit(this.placesRepository) : super(PlacesInitial());

  Future<void> fetchNearbyPlaces(double lat, double lng) async {
    try {
      emit(PlacesLoading());
      final places = await placesRepository.getNearbyPlaces(lat, lng);
      emit(PlacesLoaded(places));
    } catch (e) {
      emit(PlacesError('Failed to fetch places'));
    }
  }
}