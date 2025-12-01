import 'package:finger_game/constraints.dart';
import 'package:finger_game/l10n/app_localizations.dart';
import 'package:finger_game/models/product.dart';
import 'package:finger_game/pages/checkoutpage.dart';
import 'package:finger_game/provider/cartprovider.dart';
import 'package:finger_game/provider/localeprovider.dart';
import 'package:finger_game/widgets/Appbar.dart';
import 'package:finger_game/widgets/homeBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:finger_game/provider/translate.dart';

class ItemDetails extends StatefulWidget {
  final Product product;

  const ItemDetails({super.key, required this.product});
  

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  int icount=1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return Scaffold(
      backgroundColor: widget.product.color,
      appBar: Appbar(
        backgroundColor: widget.product.color,
        tColor: Colors.white,
        press: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height,
              child: Stack(
                children: [
                  Container(
                    //  height: 700,
                    margin: EdgeInsets.only(top: height * 0.33),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                  ),
                  Consumer2<CartProvider,Localeprovider>(
                    builder: (context, value, localeProvider, child){
                       final lang = localeProvider.currentLanguageCode;
                      // Ensure product is translated
        

                      return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(kPadding),

                          child: Text(
                            widget.product.translatedName?[lang] ?? widget.product.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(kPadding),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.price,
                                    style: TextStyle(
                                      fontSize: 15,

                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "\$" + widget.product.price.toString(),
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Expanded(
                              child: Image.asset(
                                widget.product.image,
                                height: height * 0.30,
                                width: width * 0.25,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(kPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                               widget.product.translatedTitle?[lang] ?? widget.product.title,
                                style: TextStyle(
                                  fontSize: width * 0.07,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: kPadding / 2),
                              Text(
                                widget.product.translatedDescription?[lang] ?? widget.product.description,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: const Color.fromARGB(
                                    255,
                                    96,
                                    95,
                                    95,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                        
                          children: [
                            SizedBox(width:20,),
                            IconButton(onPressed: (){
                              
                               setState(() {
                                icount++;
                               });
                            }, icon:Icon(Icons.add)),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                              decoration: BoxDecoration(
                                
                                border:BoxBorder.all(),
                              
                              ),
                              child: Text(icount.toString()),),
                            IconButton(onPressed: (){
                              setState(() {
                                if(icount>1){
                                  icount--;
                                }
                              });
                            }, icon: Icon(Icons.remove))

                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MaterialButton(
                              onPressed: () {
                                value.addToCart(widget.product,icount);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      AppLocalizations.of(
                                        context,
                                      )!.cartsnackbox,
                                    ),
                                    duration: Duration(seconds: 2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                    // margin: EdgeInsets.all(8),
                                  ),
                                );
                              },

                              color: widget.product.color,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  AppLocalizations.of(context)!.addtocart,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),

                            MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Checkoutpage(product: [widget.product],isFromcart: false,count:icount,),
                                  ),
                                );
                              },
                              height: 50,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              color: Colors.black,

                              //  margin: EdgeInsets.only(left: kPadding,top: kPadding),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  AppLocalizations.of(context)!.buynow,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Localizations.of(context, AppLocalizations)!.buynow.length>10?10:20,
                                  ),
                                ),
                              ),
                            ),
                          
                          ],
                        ), 
                         // Homebody(products: products) 
                      ],
                    );}
                  ),
                ],
              ),
            ),
      //      Homebody(products: products)

          ],
        ),
      ),
    );
  }
}
