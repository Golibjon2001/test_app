import 'package:dio/dio.dart';
import 'package:test_app/core/exceptions/exceptions.dart';
import 'package:test_app/core/exceptions/failures.dart';
import 'package:test_app/core/utils/either.dart';
import 'package:test_app/features/categori/data/datasources/categorie_remote_datasources.dart';
import 'package:test_app/features/categori/domain/repository/catagorie_repository.dart';

class CategoriesRepositoryImpl extends CategoryRepository{
  final CategoriesRemoteDataSources dataSources;
  CategoriesRepositoryImpl(this.dataSources);
  @override
  Future<Either<Failure, List>> getCategories() async{
    try{
      final result=await dataSources.getCategories();
      return Right(result);
    }on DioError {
      throw Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }
}