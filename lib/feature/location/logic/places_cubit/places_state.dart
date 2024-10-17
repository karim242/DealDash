import 'package:equatable/equatable.dart';
import '../../data/model/places_model.dart';

abstract class PlacesState extends Equatable {
  @override
  List<Object> get props => [];
}

class PlacesInitial extends PlacesState {}

class PlacesLoading extends PlacesState {}

class PlacesLoaded extends PlacesState {
  final List<Place> places;

  PlacesLoaded(this.places);

  @override
  List<Object> get props => [places];
}

class PlacesError extends PlacesState {
  final String message;

  PlacesError(this.message);

  @override
  List<Object> get props => [message];
}
