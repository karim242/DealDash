import 'package:dealdash/core/widget/custom_toast.dart';
import 'package:dealdash/feature/favourite/data/model/favourite_model.dart';
import 'package:dealdash/feature/favourite/data/repo/favourite_repo_impl.dart';
import 'package:dealdash/feature/favourite/logic/favourite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final FavouriteRepoImpl favouriteRepo;
  FavoriteStoresResponse? favouriteStoresResponse;

  FavouriteCubit({required this.favouriteRepo}) : super(FavouriteInitial());

  // Add store to favorite list
  Future<void> toggleFavourite(String storeId) async {
    emit(FavouriteLoading());

    try {
      final response = await favouriteRepo.addFavourite(storeId);
      showToast(response['message']);

      final newStore = favouriteStoresResponse?.data.firstWhere(
        (store) => store.id.toString() == storeId,
        // orElse: () => null,
      );

      if (newStore != null) {
        favouriteStoresResponse!.data
            .add(newStore); // Add the store to the list
      }

      emit(FavouriteAddSuccess());
    } catch (e) {
      emit(FavouriteFailure(errorMessage: e.toString()));
    }
  }

  // Fetch all favorite stores
  Future<void> getFavoriteStores() async {
    emit(FavouriteLoading());

    final result = await favouriteRepo.getFavoriteStores();

    result.fold(
      (error) {
        emit(FavouriteFailure(errorMessage: error.message ?? 'Unknown error'));
      },
      (response) {
        favouriteStoresResponse = response; // Save the favorite stores response
        emit(FavouriteSuccess(response: response));
      },
    );
  }

  // Check if a specific store is favorite
  // bool checkIfStoreIsFavorite(int storeId) {
  //   if (favouriteStoresResponse != null) {
  //     final isFavorite =
  //         favouriteStoresResponse!.data.any((store) => store.id == storeId);
  //     return isFavorite;
  //   } else {
  //     return false;
  //   }
  // }
}
