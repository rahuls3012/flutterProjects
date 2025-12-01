// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    String name;
    String course;
    int? id;

    Product({
        required this.name,
        required this.course,
         this.id,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        course: json["course"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "course": course,
        "id": id,
    };
}
