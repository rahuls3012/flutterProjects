import 'package:finger_game/constraints.dart';
import 'package:finger_game/models/product.dart';
import 'package:finger_game/widgets/Appbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class ItemDetails extends StatelessWidget {
  final Product product;

  const ItemDetails({super.key, required this.product});
  @override
  
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:product.color,
      appBar: Appbar(backgroundColor: product.color, tColor: Colors.white,press:(){
        Navigator.pop(context);
      }),
      body:SingleChildScrollView(
        child: Column(
        
          children: [
            SizedBox(
              height: height,
              child: Stack(
                children: [
                  Container(
                  //  height: 700,
                    margin: EdgeInsets.only(top: height*0.3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      )
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(kPadding),
          
                        child: Text(product.name,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white
                        ),),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(kPadding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text( "Price",style: TextStyle(
                                  fontSize: 15,
                                  
                                  color: Colors.white
                                ),
                               
                                ),
                                Text("\$" + product.price.toString(),style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),),
                              ],
                            ),
                          ),
                          SizedBox(width: kPadding,),
                          Image.asset(product.image,height: 250,width: 250,)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(kPadding),
                        child: SizedBox(
                          height: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.title,style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: kPadding/2,),
                              Text(product.description,
                               style: TextStyle(
                                fontSize: 15,
                                color: const Color.fromARGB(255, 96, 95, 95),
                              ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 50,
                            width: 150,
                           
                            decoration: BoxDecoration(
                              
                              color: product.color,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child: Text("Add to Cart",style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 150,
                          //  margin: EdgeInsets.only(left: kPadding,top: kPadding),
                            decoration: BoxDecoration(
                              
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child: Text("Buy Now",style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}