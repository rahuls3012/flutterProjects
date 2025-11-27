import 'package:finger_game/models/product.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartProvider extends ChangeNotifier {
  final Box<Product> _cartItems = Hive.box<Product>('cartbox');


 List<Product> get cartItems {
  return _cartItems.values.toList(growable: false);
}
Future<void>addToCart(Product product,int count)async{
  int index=cartItems.indexWhere((item)=>item.id==product.id);
  if(index!=-1){
    Product item=_cartItems.getAt(index)!;
    item.quantity+=count;
    await item.save();
  }
  else{
    product.quantity=count;
    await _cartItems.add(product);
  }
  notifyListeners();

}



 Future <void> addCartItem(Product product) async {
    int index = cartItems.indexWhere((e) => e.id == product.id);
    if (index != -1) {
      Product item = _cartItems.getAt(index)!;
      item.quantity ++;
      await item.save();
    } else {
      await _cartItems.add(product);
    }
    notifyListeners();
  }

 Future <void> removeItem(Product product) async{
    int index = cartItems.indexWhere((e) => e.name == product.name);
    if (cartItems[index].quantity > 1) {
      Product item = _cartItems.getAt(index)!;
      item.quantity--;
     await item.save();
    } 
    else {
      
     await _cartItems.deleteAt(index);
    }
    notifyListeners();
  }
  

  int sumofcart() {
    return cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);
  }
  int productQuantity(Product product){
    notifyListeners();
    return product.quantity;
    
  
  }
  Future<void> clearCart() async {
    for(var item in _cartItems.values){
      item.quantity=1;
      item.save();
    
    }
    await _cartItems.clear();
    notifyListeners();
  }
  void additemCount(Product product){
    


    
  }
  
}
