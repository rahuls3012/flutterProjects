import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Numberprovider extends ChangeNotifier{
  int num=0;
  void increment(){

    num++;
    notifyListeners();
  }
  void decrement(){
    num--;
    notifyListeners();
  }
 
}