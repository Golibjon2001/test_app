

import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class BasketModel {
  @HiveField(0)
  final String? image;
  @HiveField(0)
  final String? title;
  @HiveField(0)
  final dynamic price;

  BasketModel({
     this.image,
     this.title,
     this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'price': price,
    };
  }

  factory BasketModel.fromJson(Map<String, dynamic> json) {
    return BasketModel(
      image: json['image'],
      title: json['title'],
      price: json['price'],
    );
  }

  @override
  String toString() {
    return 'BasketModel{image: $image, title: $title, price: $price,}';
  }
}
