import 'package:test_app/core/exceptions/failures.dart';
import 'package:test_app/core/use_case/use_case.dart';
import 'package:test_app/core/utils/either.dart';
import 'package:test_app/features/administration/domain/entity/administration_entity.dart';
import 'package:test_app/features/administration/domain/repository/administration_repository.dart';

class AdministrationUseCase extends UseCase<List<AdministrationEntity>,NoParams>{
  final AdministrationRepository repository;
  AdministrationUseCase(this.repository);
  @override
  Future<Either<Failure, List<AdministrationEntity>>> call(NoParams params) {
    return repository.getAdministration();
  }

}