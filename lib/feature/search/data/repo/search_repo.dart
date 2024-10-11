import 'package:dartz/dartz.dart';
import 'package:dealdash/core/error/error_model.dart';
import 'package:dealdash/feature/search/data/model/offer_model.dart';

abstract class SearchRepo {

Future<Either<ErrorResponse,SearchResponse>> searchForOffer(String query);

}