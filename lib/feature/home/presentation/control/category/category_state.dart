import '../../../data/model/category_model.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<CategoryModel> categoryModel;
  CategorySuccess(this.categoryModel);
}

class CategoryError extends CategoryState {
  final String message;
  CategoryError({required this.message});
}
