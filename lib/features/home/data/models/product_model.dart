import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/features/home/data/models/product_model.g.dart';
import 'package:test_app/features/home/domain/entity/products_entity.dart';

@JsonSerializable()
class ProductModel extends ProductsEntity {
  const ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.category,
    required super.image,
    required super.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModelFromJson(json);
}
