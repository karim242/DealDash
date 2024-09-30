import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/error/failure.dart';
import '../../../data/model/category_model.dart';
import '../../../data/repo/category_repo.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryCubit(this.categoryRepository) : super(CategoryInitial());

  // Function to fetch categories
  Future<void> fetchCategories() async {
    try {
      emit(CategoryLoading());

      // Fetch categories from repository
      final Either<ServerException, List<CategoryModel>> response =
          await categoryRepository.fetchCategories();
  print("response : $response");
      response.fold(
        (error) => emit(CategoryError(message: error.errorModel.message!)),
        (categories) => emit(CategorySuccess(categories)),
      );
    } catch (e) {
      emit(CategoryError(message: 'Failed to fetch categories.'));
    }
  }
}
