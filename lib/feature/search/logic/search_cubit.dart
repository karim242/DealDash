
import 'package:dealdash/feature/search/data/repo/search_repo.dart';
import 'package:dealdash/feature/search/logic/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepo;

  SearchCubit(this.searchRepo) : super(SearchInitial());

  Future<void> searchForOffer(String query) async {
   emit(SearchLoading());

    final result = await searchRepo.searchForOffer(query);

    result.fold(
      (error) => emit(SearchFailure(error.message ?? 'Unknown error for response')),
      (offers) => emit(SearchSuccess(offers)),
    );
  }
}