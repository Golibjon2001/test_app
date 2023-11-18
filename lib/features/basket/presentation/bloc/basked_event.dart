part of 'basked_bloc.dart';

@immutable
abstract class BaskedEvent {}

class AddProductBasked extends BaskedEvent{
  final BasketModel productsEntity;

  AddProductBasked(this.productsEntity);
}
class RemoveProductBasked extends BaskedEvent{
  final BasketModel productsEntity;

  RemoveProductBasked(this.productsEntity);
}
