import 'package:test_app/core/exceptions/failures.dart';
import 'package:test_app/core/use_case/use_case.dart';
import 'package:test_app/core/utils/either.dart';
import 'package:test_app/features/categori/domain/repository/catagorie_repository.dart';

class CategoriesUseCase extends UseCase<List<dynamic>,NoParams>{
  final CategoryRepository categoryRepository;
  CategoriesUseCase(this.categoryRepository);
  @override
  Future<Either<Failure, List>> call(NoParams params)async {
    return await categoryRepository.getCategories();
  }
}