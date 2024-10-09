import 'package:dartz/dartz.dart';
import 'package:dealdash/core/cache_helper/cache_helper.dart';
import 'package:dealdash/core/error/error_model.dart';
import 'package:dealdash/core/error/failure.dart';
import 'package:dealdash/core/network_helper/dio_helper.dart.dart';
import 'package:dealdash/feature/search/data/model/offer_model.dart';
import 'package:dealdash/feature/search/data/repo/search_repo.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);


  @override
 Future<Either<ErrorResponse, List<Offer>>> searchForOffer(String query) async {
    try {
      print("//////////////////////////////////////////////////");
      String? token = CacheHelper.getToken();
      final response = await apiService.getData(
        endpoint: '/api/v1/user/search',
        query: {
          'query': query,
          'per_page': 15,
        },
        token: token,
      );
     if (response['success'] == true) {
       print(response['data']);
      final List data = response['data']; 

      final List<Offer> offers = data.map((item) {
          return Offer.fromJson(item as Map<String, dynamic>);
      }).toList();
        print(" offerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
        return Right(offers);
      } else {
        return Left(ErrorResponse(
          message: response['message'],
          data: List<String>.from(response['errors']),
        ));
      }
    } on DioException catch (e) {
      handelDioException(e);
      return Left(ErrorResponse.fromJson(e.response?.data ?? {}));
    }
  }
}