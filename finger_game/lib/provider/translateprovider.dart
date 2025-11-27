import 'package:flutter/material.dart';
import 'package:finger_game/provider/translate.dart';

class TranslationProvider with ChangeNotifier {
  String? name;
  String? title;
  String? description;

  bool isLoading = false;

  Future<void> translateProduct({
    required String originalName,
    required String originalTitle,
    required String originalDescription,
    required String lang,
  }) async {
    if (lang != "ar") {
      name = originalName;
      title = originalTitle;
      description = originalDescription;
      notifyListeners();
      return;
    }

    isLoading = true;
    notifyListeners();

    name = await translateText(originalName, "ar");
    title = await translateText(originalTitle, "ar");
    description = await translateText(originalDescription, "ar");

    isLoading = false;
    notifyListeners();
  }
}
