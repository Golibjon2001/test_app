import 'package:equatable/equatable.dart';
import 'package:test_app/core/exceptions/failures.dart';
import 'package:test_app/core/utils/either.dart';



abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class StreamUseCase<Type, Params> {
  Stream<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
