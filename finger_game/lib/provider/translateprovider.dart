import 'package:flutter/material.dart';
import '../models/product.dart';
import '../provider/translate.dart'; // contains ProductTranslationHelper

class TranslateProvider extends ChangeNotifier {
  bool isTranslating = false;
  final ProductTranslationHelper _translationHelper = ProductTranslationHelper();

  Future<void> translateAllProducts(List<Product> products, String langCode) async {
    for (var product in products) {
     
    }
    isTranslating = false;
    notifyListeners();
  }
}
