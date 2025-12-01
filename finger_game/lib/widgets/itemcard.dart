
import 'package:finger_game/provider/localeprovider.dart';
import 'package:finger_game/provider/translateprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constraints.dart';
import '../models/product.dart';
import '../provider/translate.dart';
import 'package:hive_flutter/hive_flutter.dart';
class Itemcard extends StatelessWidget {
 final Product products;
 final VoidCallback press;
 Itemcard({super.key, required this.products, required this.press});


  @override
   Widget build(BuildContext context) {
  
    final  size= MediaQuery.of(context).size;
    return Consumer<Localeprovider>(builder: (context, localeProvider, child) {
      final lang = localeProvider.currentLanguageCode;
      // Ensure product is translated
    //  ProductTranslationHelper.translateProduct(products, lang); 
      return GestureDetector(
        onTap: press,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding/4),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                // margin: EdgeInsets.all(kPadding),
                padding: EdgeInsets.all(kPadding),
                 width: size.width/2.5,
                 height: size.height/6,
                decoration: BoxDecoration(
                  color: products.color,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(products.image),
              ),
            
                 Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0.1),
                  child: Text(
                  products.translatedName?[lang]?? products.name,
                    style: TextStyle(color: kTextColor),
                  ),
                ),
              
              Text(
                products.price.toString(),
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
    });
  }
}