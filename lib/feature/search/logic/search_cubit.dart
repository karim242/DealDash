
import 'package:dealdash/feature/search/data/repo/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepo;

  SearchCubit(this.searchRepo) : super(SearchInitial());

  Future<void> searchForOffer(String query) async {
    emit(SearchLoading());

    final result = await searchRepo.searchForOffer(query);
    print("result $result");
    
    result.fold(
      (error) => emit(SearchFailure(error.message ?? 'Unknown error')),
      (searchResponse) => emit(SearchSuccess(searchResponse)), // تمرير الاستجابة الكاملة
    );
  }
}