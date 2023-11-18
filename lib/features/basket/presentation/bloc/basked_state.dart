part of 'basked_bloc.dart';

@immutable
class BaskedState extends Equatable {
  final FormzSubmissionStatus? status;
  final List<BasketModel>? productsEntity;

  const BaskedState({this.productsEntity, this.status});

  BaskedState copyWith({
    final FormzSubmissionStatus? status,
    final List<BasketModel>? productsEntity,
  }) =>
      BaskedState(
        status: status ?? this.status,
        productsEntity: productsEntity ?? this.productsEntity,
      );

  @override
  List<Object?> get props => [status, productsEntity];
}
