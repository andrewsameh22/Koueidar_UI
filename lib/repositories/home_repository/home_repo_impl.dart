import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:koueidar_ui/models/product_model.dart';
import '../../core/networks/failures.dart';
import '../../core/networks/remote/api_constants.dart';
import '../../core/networks/remote/dio_helper.dart';
import '../../models/filter_product_model.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  @override
  Future<Either<Failure, ProductsModel>> fetchHomeProducts({
    required page,
    required perPage,
    FilterProductModel? model,
  }) async {
    try {
      var response = await DioHelper.getData(
          url: ApiConstants.getAllProductsEndPoint,
          query: {
            'page': page,
            'products_per_page': perPage,
            if (model != null) ...model.toMap(),
          });
      return right(ProductsModel.fromJson(response.data));
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      if (kDebugMode) {
        print("Error when get Home Products data $error");
      }
    }
    return left(ServerFailure(''));
  }
}
