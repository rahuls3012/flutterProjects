import 'package:flutter/material.dart';
import 'package:finger_game/models/product.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:translator/translator.dart';

final translator = GoogleTranslator();
final productBox = Hive.box<Product>('products');
final List<Product> tproducts = productBox.values.toList();



class ProductTranslationHelper {
  /// Translate product and store in Hive if translation for this language doesn't exist
  static Future<void> translateProduct(Product tproduct, String langCode) async {
    tproduct.translatedName ??= {};
    tproduct.translatedTitle ??= {};
    tproduct.translatedDescription ??= {};
   
    if (!tproduct.translatedName!.containsKey(langCode) ||
        !tproduct.translatedTitle!.containsKey(langCode) ||
        !tproduct.translatedDescription!.containsKey(langCode))
{
  const sep = "␞";
    // Merge fields into ONE call to reduce API requests
      final combined = "${tproduct.name}$sep${tproduct.title}$sep${tproduct.description}";
      final translated = await translator.translate(combined, to: langCode);
      final parts = translated.text.split(sep);
if (parts.length != 3) {
        // Handle error: translation did not return expected number of parts
        print("Translation error for product ID ${tproduct.id} to $langCode");
        return;
      }else{
      tproduct.translatedName![langCode] = parts[0];
      tproduct.translatedTitle![langCode] = parts[1];
      tproduct.translatedDescription![langCode] = parts[2];
      }
      // Save updated product in Hive
      // await productBox.put(tproduct.id, tproduct);
      await tproduct.save();
     
    }
  }
  

   
  
  
  /// Get translated fields using current language
  static String getTranslatedName(Product product, String langCode) =>
      product.translatedName?[langCode] ?? product.name;

  static String getTranslatedTitle(Product product, String langCode) =>
      product.translatedTitle?[langCode] ?? product.title;

  static String getTranslatedDescription(Product product, String langCode) =>
      product.translatedDescription?[langCode] ?? product.description;
}
