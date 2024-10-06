import 'package:dealdash/feature/favourite/data/model/favourite_model.dart';

abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class FavouriteLoading extends FavouriteState {}

class FavouriteSuccess extends FavouriteState {
  final FavoriteStoresResponse response;

  FavouriteSuccess({required this.response});
}

class FavouriteToggled extends FavouriteState {
  final bool isFavourite;

  FavouriteToggled({required this.isFavourite});
}


class FavouriteFailure extends FavouriteState {
  final String errorMessage;
  FavouriteFailure({required this.errorMessage});
}

 class FavouriteAddSuccess extends FavouriteState {
//   final bool isFavorite;
//   FavouriteCheckState({required this.isFavorite});
}