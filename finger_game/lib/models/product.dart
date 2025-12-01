import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'product.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final int  price;
  @HiveField(4)
  final int id;
  @HiveField(5)
  final String image;
  @HiveField(6)
  final int colorvalue;
  Color get color=>Color(colorvalue);
  @HiveField(7)
  int  quantity;
  @HiveField(8)
  final List<String> category;
  @HiveField(9)
  Map<String, String>? translatedName;
  @HiveField(10)
  Map<String, String>? translatedTitle;
  @HiveField(11)
  Map<String, String>? translatedDescription;
  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.colorvalue,
    required this.id,
    required this.title,
    required this.category,
    this.quantity=0,
     this.translatedName,
     this.translatedTitle,
     this.translatedDescription,
  });
}
