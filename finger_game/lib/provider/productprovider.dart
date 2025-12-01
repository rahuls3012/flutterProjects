import 'package:finger_game/models/product.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
final productbox = Hive.box<Product>('products');
final products=productbox.values.toList();
class Productprovider extends ChangeNotifier{
  List<Product> allProducts=products;
  List<Product>searchResults=products;
  String category="all";
  String searchstring="";
  int selectedIndex=0;
  
  void filterItems(String text){
    searchResults=allProducts.where((item)=>item.name.toLowerCase()
    .contains(text.toLowerCase())).toList();
    notifyListeners();
  }
  void categoryFilter(String text){
    
    if(text=="all"){
      searchResults=allProducts;
      notifyListeners();
      return;
    }
    else{
    searchResults=allProducts.where((item)
    {
      return item.category.any((e)=>e.toLowerCase().contains(text.toLowerCase()));
    })
    .toList();
    notifyListeners();}
  }
  
  int setSelectedIndex(int index){
    selectedIndex=index;
    notifyListeners();
    return selectedIndex;
  }

}