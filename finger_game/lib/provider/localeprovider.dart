import 'package:finger_game/provider/translate.dart';
import 'package:finger_game/provider/translateprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:finger_game/models/product.dart';
import 'package:hive_flutter/hive_flutter.dart';
final productbox = Hive.box<Product>('products');
final products=productbox.values.toList();
class Localeprovider extends ChangeNotifier{
  Locale _locale= const Locale('en');
  Locale get locale => _locale;
  void changeLoacle(Locale locale){
    _locale=locale;
    changelanguage();
    notifyListeners();
  }
  Future<void> changelanguage()async{
    if(_locale.languageCode=='ar'){
    for(var product in products){
      
     await ProductTranslationHelper.translateProduct(product, 'ar');
    
    }
    }
    if(_locale.languageCode=='en'){
      for(var product in products){
      await ProductTranslationHelper.translateProduct(product, 'en');
    }
    }
    if(_locale.languageCode=='ta'){
      for(var product in products){
      await ProductTranslationHelper.translateProduct(product, 'ta');
    }
    }
    notifyListeners();
    
    
  }
  
  String get currentLanguageCode => _locale.languageCode;
  
}