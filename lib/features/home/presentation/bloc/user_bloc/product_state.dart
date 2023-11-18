
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';
import 'package:test_app/features/home/domain/entity/products_entity.dart';


@immutable
class ProductState extends Equatable {
  final List<ProductsEntity>? productList;
  final FormzSubmissionStatus? status;

  const ProductState({
    this.productList,
    this.status,
  });

  ProductState copyWith({
    List<ProductsEntity>? productList,
    FormzSubmissionStatus? status,
  }) =>
      ProductState(
        productList: productList ?? this.productList,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [productList, status];
}
