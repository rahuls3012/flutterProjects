import'package:flutter/material.dart';
import 'product.dart';
List<Product> sampleproducts = [
  Product(
    id: 1,
    name: "Sneakers",
    title: "AirMax 2025",
    description: "Comfortable running shoes with breathable mesh.",
    price: 120,
    image:"assets/images/sneaker.png",
    colorvalue: Colors.blue.toARGB32(),
    category: ['shoes','sports','men']
    
  ),
  Product(
    id: 2,
    name: "Smartphone",
    title: "Galaxy X",
    description: "Latest smartphone with AMOLED display and 5G support.",
    price: 999,
    image: "assets/images/phone.png",
    colorvalue: Colors.black.toARGB32(),
    category: ['electronics','mobile','gadgets']
  ),
  Product(
    id: 3,
    name: "Laptop",
    title: "UltraBook Pro",
    description: "Lightweight laptop with powerful performance.",
    price: 1500,
    image: "assets/images/laptop_.png",
    colorvalue: Colors.grey.toARGB32(),
    category: ['electronics','computers','gadgets']
  ),
  Product(
    id: 4,
    name: "Headphones",
    title: "Noise Cancelling",
    description: "Wireless headphones with active noise cancellation.",
    price: 250,
    image: "assets/images/headphones.png",
    colorvalue: Colors.redAccent.toARGB32(),
    category: ['electronics','audio','gadgets']
  ),
  Product(
    id: 5,
    name: "Watch",
    title: "SmartWatch 5",
    description: "Fitness tracking smartwatch with heart rate monitor.",
    price: 199,
    image: "assets/images/watches.png",
    colorvalue: Colors.green.toARGB32(),
    category: ['electronics','wearables','gadgets']
  ),
  Product(
    id: 6,
    name: "Backpack",
    title: "Travel Pack",
    description: "Durable backpack with multiple compartments.",
    price: 80,
    image: "assets/images/Backpack.png",
    colorvalue: Colors.brown.toARGB32(),
    category: ['accessories','travel','bags']
  ),
  Product(
    id: 7,
    name: "Camera",
    title: "DSLR Pro",
    description: "Professional DSLR camera with 24MP sensor.",
    price: 1200,
    image: "assets/images/DSLR-Camera-PNG.png",
    colorvalue: Colors.deepPurple.toARGB32(),
    category: ['electronics','photography','gadgets']
  ),
  Product(
    id: 8,
    name: "Tablet",
    title: "Tab Ultra",
    description: "High-resolution tablet for work and play.",
    price: 600,
    image: "assets/images/laptop_.png",
    colorvalue: Colors.orange.toARGB32(),
    category: ['electronics','mobile','gadgets']
  ),
  Product(
    id: 9,
    name: "Gaming Console",
    title: "PlayBox 5",
    description: "Next-gen gaming console with 4K support.",
    price: 499,
    image: "assets/images/sony_playstation.png",
    colorvalue: Colors.indigo.toARGB32(),
    category: ['electronics','gaming','gadgets']
  ),
  Product(
    id: 10,
    name: "Jacket",
    title: "Winter Coat",
    description: "Warm and stylish jacket for cold weather.",
    price: 150,
    image: "assets/images/jacket.png",
    colorvalue: Colors.teal.toARGB32(),
    category: ['clothes','men','women']
  ),
  Product(
    id:11,
    price: 200,
    name: "Perfume",
    title: "New Deo",
    description: "pefume that lasts all day long.this fragrance combines fresh citrus top notes with a warm, woody base, creating an irresistible scent perfect for any occasionthe sleek bottle design reflects the modern and sophisticated nature of the fragrance inside",
    image: "assets/images/perfume1.jpg",
    colorvalue: Colors.cyan.toARGB32(),
    category: ['accessories','fragrances','men']
  ),
  Product(
  id: 12,
  price: 1500,
  name: "Table Fan",
  title: "Electric Table Fan",
  description:
      "A powerful and energy-efficient table fan designed to keep your space cool and comfortable. "
      "It features high-speed airflow, adjustable tilt settings, and silent operation for a peaceful environment. "
      "With a sturdy build and sleek design, this fan is perfect for home, office, or personal use.",
  image: "assets/images/tablefan1.png",
  colorvalue: Colors.blueAccent.toARGB32(),
  category: ['electronics', 'home appliances', 'cooling']
),

];
