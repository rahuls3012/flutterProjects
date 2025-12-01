import 'package:finger_game/animations/sucessanimation.dart';
import 'package:finger_game/l10n/app_localizations.dart';
import 'package:finger_game/models/product.dart';
import 'package:finger_game/provider/cartprovider.dart';
import 'package:finger_game/provider/localeprovider.dart';
import 'package:finger_game/provider/orderlistprovider.dart';
import 'package:finger_game/widgets/Appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
class Checkoutpage extends StatelessWidget{
    List<Product> product=[];
   final int? count;
    final bool isFromcart;
   Checkoutpage({required this.product,required this.isFromcart,  this.count});
   
  @override
  Widget build(BuildContext context) {
    if(!isFromcart){
      product[0].quantity=count!;
    }
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 211, 211, 211),
      
      appBar: Appbar(title: AppLocalizations.of(context)!.checkout,press: () {
        Navigator.pop(context);
      },),
      body: Column(
        
       
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0,2)
                )],
                color: Colors.white,
              borderRadius: BorderRadius.circular(10)
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(6),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context)!.ordersummary,
                  style: TextStyle(fontSize: 20.sp,
                  fontWeight: FontWeight.bold),),
                  Expanded(
                    child: ListView.builder(itemCount: product.length,
                    shrinkWrap: true,
                    
                    itemBuilder: (context, index) =>ListTile(
                      title: Text(product[index].translatedName?[Provider.of<Localeprovider>(context).locale.languageCode]??product[index].name),
                      trailing: SizedBox(
                        width: 100.sp,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                           mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(product[index].quantity.toString()),
                           
                            Text('\$ '+(product[index].price*product[index].quantity).toString())
                          ],
                        
                        ),
                      ),
                    ) ,
                    ),
                  ),
                  Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(255, 234, 234, 234),
                  ),
                    padding: EdgeInsets.only(right: 35.sp),
                    
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(AppLocalizations.of(context)!.total,style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(width: 100.sp,),
                         Consumer<CartProvider>(builder:(context,value,child)=>
                    Text(product.length==1? "\$${product[0].price*product[0].quantity}":"\$ "+value.sumofcart().toString(),
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp),)
                    )
                    
                      ],
                    ),
                  )
                 
                ],
              ),
            ),
          ),
         Expanded(
           child: SingleChildScrollView(
             child: Container(

             // height: 200,
              margin: EdgeInsets.all(10.sp),
              
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0,2)
                )],
                color:  Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
                padding: EdgeInsets.all(10.sp),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.payment,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),),
                    ExpansionTile(
                      
                      backgroundColor:  const Color.fromARGB(255, 234, 234, 234),
                      leading: Icon(Icons.monetization_on),
                      title: Text(AppLocalizations.of(context)!.selectpay),
                      children: [
                        ListTile(
                          leading: Icon(Icons.currency_rupee_outlined),
                          title: Text(AppLocalizations.of(context)!.cod),
                        ),
                        ListTile(
                          leading: Icon(  Icons.credit_card),
                          title: Text(AppLocalizations.of(context)!.onlinepay),
                        )
                      ],
                    )
                  ]
                ),
              ),
           ),
         ),
          SizedBox(height: 100.sp,),
          Container(
            padding: EdgeInsets.only(bottom: 40.sp),
            child: MaterialButton(onPressed: (){
              
              
              showSuccessAnimation(context);
              Provider.of<Orderlistprovider>(context,listen: false).addOrderItem(product);
              if(isFromcart){
              Provider.of<CartProvider>(context,listen: false).clearCart();
              }
            },
            color: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 70.sp,vertical: 10.sp),
            child: Text(AppLocalizations.of(context)!.placeorder,
            style: TextStyle(color: Colors.white),),),
          )
         
        ],
      ),

    );
    
  }
}
