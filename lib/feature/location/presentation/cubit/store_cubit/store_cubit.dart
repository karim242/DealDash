import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/store/store_repo.dart';
import 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  final StoreRepository storeRepository;

  StoreCubit(this.storeRepository) : super(StoreInitial());

  Future<void> fetchNearbyStores(double? lat , double? long) async {
    try {
      emit(StoreLoading());

      final result = await storeRepository.getNearbyStores( lat ,  long);

      result.fold(
        (failure) => emit(StoreError(failure.errorModel.message!)),
        (stores) => emit(StoreLoaded(stores.data)),
      );
    } catch (e) {
      emit(StoreError('There are no offers near you. '));
    }
  }
}