import 'package:dealdash/feature/search/data/model/offer_model.dart';
import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final SearchResponse searchResponse;

  const SearchSuccess(this.searchResponse);

  @override
  List<Object> get props => [searchResponse];
}

class SearchFailure extends SearchState {
  final String errorMessage;

  const SearchFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
