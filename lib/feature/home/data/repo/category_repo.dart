import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../model/category_model.dart';


abstract class CategoryRepository {
Future<Either<ServerException,CategoryModel>> fetchCategories();
}