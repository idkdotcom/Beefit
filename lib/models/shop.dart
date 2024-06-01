import 'package:beefit/value_objects/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  final List<Product> _products = [
    Product(
      name: 'Whey Protein',
      description: 'High-quality whey protein for muscle building.',
      price: 29.99,
      imageUrl: 'lib/assets/beefitlogo_onlyBee.png',
    ),
    Product(
      name: 'Vegan Protein',
      description: 'Plant-based protein for a healthy diet.',
      price: 24.99,
      imageUrl: 'lib/assets/beefitlogo_onlyBee.png',
    ),
    // Add more products here
  ];

  // User cart
  List<Product> _cart = [];

  // Get product
  List<Product> get products => _products;

  // Get cart
  List<Product> get cart => _cart;

  // Add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // Remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}