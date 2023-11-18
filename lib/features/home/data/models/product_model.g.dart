import 'package:test_app/features/home/data/models/product_model.dart';

ProductModel ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? "",
      price: json['price'] as dynamic,
      description: json['description'] as String? ?? '',
      category: json['category'] as String? ?? '',
      image: json['image'] as String? ?? '',
      rating: json['rating'] as Map<String, dynamic>? ?? {},
    );

Map<String, dynamic> ProductModelToJson(ProductModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'category': instance.category,
      'image': instance.image,
      'rating': instance.rating,
    };
