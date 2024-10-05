
import 'package:dealdash/core/widget/custom_toast.dart';
import 'package:dealdash/feature/favourite/data/repo/favourite_repo_impl.dart';
import 'package:dealdash/feature/favourite/logic/favourite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final FavouriteRepoImpl favouriteRepo;

  FavouriteCubit({required this.favouriteRepo}) : super(FavouriteInitial());

  Future<void> addFavourite(String storeId) async {
    emit(FavouriteLoading());

    try {
     final response =  await favouriteRepo.addFavourite(storeId);
      showToast(response['message'],);
      emit(FavouriteToggled(isFavourite: true));
    } catch (e) {
      emit(FavouriteFailure(errorMessage: e.toString()));
    }
  }

  Future<void> removeFavourite(String storeId) async {
    emit(FavouriteLoading());

    try {
    final response =  await favouriteRepo.removeFavourite(storeId);
          showToast(response['message'],);

      emit(FavouriteToggled(isFavourite: false));
    } catch (e) {
      emit(FavouriteFailure(errorMessage: e.toString()));
    }
  }


  Future<void> getFavoriteStores() async {
    emit(FavouriteLoading());

    try {
      final response = await favouriteRepo.getFavoriteStores();
      emit(FavouriteSuccess(response: response));
    } catch (e) {
      emit(FavouriteFailure(errorMessage: e.toString()));
    }
  }
}