import 'package:dio/dio.dart';
import 'package:test_app/core/exceptions/exceptions.dart';
import 'package:test_app/core/exceptions/failures.dart';
import 'package:test_app/core/utils/either.dart';
import 'package:test_app/features/administration/data/datasources/administration_datasources.dart';
import 'package:test_app/features/administration/domain/entity/administration_entity.dart';
import 'package:test_app/features/administration/domain/repository/administration_repository.dart';

class AdministrationRepositoryImpl extends AdministrationRepository{
  final AdministrationDataSources dataSources;
  AdministrationRepositoryImpl(this.dataSources);
  @override
  Future<Either<Failure, List<AdministrationEntity>>> getAdministration() async{
    try {
      final result = await dataSources.getAdministration();
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