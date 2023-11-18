import 'package:test_app/core/exceptions/failures.dart';
import 'package:test_app/core/utils/either.dart';
import 'package:test_app/features/administration/domain/entity/administration_entity.dart';

abstract class AdministrationRepository{
  Future<Either<Failure,List<AdministrationEntity>>> getAdministration();
}