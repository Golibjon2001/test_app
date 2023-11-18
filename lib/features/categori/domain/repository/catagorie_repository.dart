import 'package:test_app/core/exceptions/failures.dart';
import 'package:test_app/core/utils/either.dart';

abstract class CategoryRepository{
  Future<Either<Failure,List<dynamic>>> getCategories();
}