import 'package:dartz/dartz.dart';
import 'package:koueidar_ui/models/product_model.dart';

import '../../core/networks/failures.dart';
import '../../models/filter_product_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, ProductsModel>> fetchHomeProducts({
    required page,
    required perPage,
    FilterProductModel? model,
  });
}
