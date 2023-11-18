import 'package:dio/dio.dart';
import 'package:test_app/core/exceptions/exceptions.dart';
import 'package:test_app/core/exceptions/failures.dart';
import 'package:test_app/core/utils/either.dart';
import 'package:test_app/features/home/data/datasources/product_remote_datasources.dart';
import 'package:test_app/features/home/domain/entity/products_entity.dart';
import 'package:test_app/features/home/domain/repository/product_repository.dart';


class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSources dataSources;

  ProductRepositoryImpl(this.dataSources);

  @override
  Future<Either<Failure, List<ProductsEntity>>> getUser() async {
    try {
      final result = await dataSources.getUsers();
      return Right(result);
    } on DioError {
      throw Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }
}
