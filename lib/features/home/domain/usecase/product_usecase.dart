

import 'package:test_app/core/exceptions/failures.dart';
import 'package:test_app/core/use_case/use_case.dart';
import 'package:test_app/core/utils/either.dart';
import 'package:test_app/features/home/domain/entity/products_entity.dart';
import 'package:test_app/features/home/domain/repository/product_repository.dart';



class ProductUseCase extends UseCase<List<ProductsEntity>, NoParams> {
  final ProductRepository repository;

  ProductUseCase(this.repository);

  @override
  Future<Either<Failure, List<ProductsEntity>>> call(NoParams params) async {
    return await repository.getUser();
  }
}

