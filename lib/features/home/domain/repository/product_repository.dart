




import 'package:test_app/core/exceptions/failures.dart';
import 'package:test_app/core/utils/either.dart';
import 'package:test_app/features/home/domain/entity/products_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductsEntity>>> getUser();
}
