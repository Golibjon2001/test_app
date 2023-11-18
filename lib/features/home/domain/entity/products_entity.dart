import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class ProductsEntity extends Equatable {
  @JsonKey(defaultValue: '')
  final int id;
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: '')
  final dynamic price;
  @JsonKey(defaultValue: '')
  final String description;
  @JsonKey(defaultValue: '')
  final String category;
  @JsonKey(defaultValue: '')
  final Map<String, dynamic> rating;
  @JsonKey(defaultValue: '')
  final String image;

  const ProductsEntity(
      {required this.id,
      required this.description,
      required this.title,
      required this.image,
      required this.category,
      required this.price,
      required this.rating});

  @override
  List<Object?> get props => [id, title, description, image, category, price, rating];
}
