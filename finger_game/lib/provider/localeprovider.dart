import 'package:flutter/material.dart';
class Localeprovider extends ChangeNotifier{
  Locale _locale= const Locale('en');
  Locale get locale => _locale;
  void changeLoacle(Locale locale){
    _locale=locale;
    notifyListeners();
  }
  String get currentLanguageCode => _locale.languageCode;
  
}