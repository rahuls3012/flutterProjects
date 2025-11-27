import 'package:finger_game/constraints.dart';
import 'package:finger_game/l10n/app_localizations.dart';
import 'package:finger_game/models/product.dart';
import 'package:finger_game/pages/itemDeatails.dart';
import 'package:finger_game/widgets/category.dart';
import 'package:finger_game/widgets/itemcard.dart';
import 'package:flutter/material.dart';

class Homebody extends StatefulWidget {
 
  final List<Product> products;
 const Homebody({super.key,required this.products});
  @override
  State<Homebody> createState() => _HomebodyState();
}

class _HomebodyState extends State<Homebody> {
  
  
  @override
  Widget build(BuildContext context) {
    
    //final size = MediaQuery.of(context).size;
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          child: Text(
            AppLocalizations.of(context)!.appTitle,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        Category(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding/2),
            child: GridView.builder(
              itemCount: widget.products.length,
                      
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
             
               childAspectRatio: 0.80,
              // mainAxisSpacing: kPadding,
              // crossAxisSpacing: kPadding,
              ),
                      
              itemBuilder: (context, index) =>Container(
           //     height:size.height/6 ,
                alignment: Alignment.center,
               
                child: Itemcard(press: (){
                   Navigator.push(context, 
                   MaterialPageRoute(builder:(context)=>
                   ItemDetails(product: widget.products[index])));
                  }, products: widget.products[index]),
              ),
              ),
            ),
        ),
       
      ],
    );
  }
}


