import 'package:flutter/material.dart';
class Product {
  final String name,title;
  final String description;
  final int  price,id;
  final String image;
  final Color color;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.color,
    required this.id,
    required this.title,
  });
}
List<Product> products = [
  Product(
    id: 1,
    name: "Sneakers",
    title: "AirMax 2025",
    description: "Comfortable running shoes with breathable mesh.",
    price: 120,
    image:"assets/images/sneaker.png",
    color: Colors.blueAccent,
  ),
  Product(
    id: 2,
    name: "Smartphone",
    title: "Galaxy X",
    description: "Latest smartphone with AMOLED display and 5G support.",
    price: 999,
    image: "assets/images/phone.png",
    color: Colors.black,
  ),
  Product(
    id: 3,
    name: "Laptop",
    title: "UltraBook Pro",
    description: "Lightweight laptop with powerful performance.",
    price: 1500,
    image: "assets/images/laptop_.png",
    color: Colors.grey,
  ),
  Product(
    id: 4,
    name: "Headphones",
    title: "Noise Cancelling",
    description: "Wireless headphones with active noise cancellation.",
    price: 250,
    image: "assets/images/headphones.png",
    color: Colors.redAccent,
  ),
  Product(
    id: 5,
    name: "Watch",
    title: "SmartWatch 5",
    description: "Fitness tracking smartwatch with heart rate monitor.",
    price: 199,
    image: "assets/images/watches.png",
    color: Colors.green,
  ),
  Product(
    id: 6,
    name: "Backpack",
    title: "Travel Pack",
    description: "Durable backpack with multiple compartments.",
    price: 80,
    image: "assets/images/Backpack.png",
    color: Colors.brown,
  ),
  Product(
    id: 7,
    name: "Camera",
    title: "DSLR Pro",
    description: "Professional DSLR camera with 24MP sensor.",
    price: 1200,
    image: "assets/images/DSLR-Camera-PNG.png",
    color: Colors.deepPurple,
  ),
  Product(
    id: 8,
    name: "Tablet",
    title: "Tab Ultra",
    description: "High-resolution tablet for work and play.",
    price: 600,
    image: "assets/images/laptop_.png",
    color: Colors.orange,
  ),
  Product(
    id: 9,
    name: "Gaming Console",
    title: "PlayBox 5",
    description: "Next-gen gaming console with 4K support.",
    price: 499,
    image: "assets/images/sony_playstation.png",
    color: Colors.indigo,
  ),
  Product(
    id: 10,
    name: "Jacket",
    title: "Winter Coat",
    description: "Warm and stylish jacket for cold weather.",
    price: 150,
    image: "assets/images/jacket.png",
    color: Colors.teal,
  ),
];
