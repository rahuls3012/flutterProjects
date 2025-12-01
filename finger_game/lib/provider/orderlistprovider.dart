import 'package:finger_game/models/product.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:finger_game/models/orderlist.dart';

class Orderlistprovider extends ChangeNotifier{
  
  
  final Box<OrderList> _orderBox=Hive.box<OrderList>('orderbox');
  List<OrderList> get orderItems{
    return _orderBox.values.toList(growable: false);
  }
  Future<void> addOrderItem(List<Product> orderList) async{
    final Cproduct=orderList.map((e)=>Product(
      id: e.id,
      name: e.name,
      title: e.title,
      colorvalue: e.colorvalue,
      description: e.description,
      price: e.price,
      image: e.image,
      quantity: e.quantity,
      category: e.category,
      translatedName: {...?e.translatedName},
      translatedTitle:{...?e.translatedTitle},
      translatedDescription:{...?e.translatedDescription},
    )).toList();
   final newOrder= OrderList(
  
      orderId: DateTime.now().microsecondsSinceEpoch.toString(),
      orderedProduct: Cproduct,
      totalAmount: Cproduct.fold(0, (sum, item) => sum + item.price * item.quantity),
    
      orderDate:DateTime.now(),
    );
    await _orderBox.add(newOrder);
    notifyListeners();
  }
  
  void clearOrders(int dindex){
    _orderBox.deleteAt(dindex);
    notifyListeners();
  }
}