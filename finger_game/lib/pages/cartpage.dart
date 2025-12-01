import 'package:finger_game/l10n/app_localizations.dart';
import 'package:finger_game/pages/checkoutpage.dart';
import 'package:finger_game/pages/homePage.dart';
import 'package:finger_game/provider/cartprovider.dart';
import 'package:finger_game/provider/localeprovider.dart';
import 'package:finger_game/widgets/Appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
class Cartpage extends StatefulWidget{
  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: Appbar(title:AppLocalizations.of(context)!.cart,press: () {
      Navigator.pop(context);
    },),
    body:Consumer2<CartProvider,Localeprovider>(builder: (context, value, localeProvider, child) => 
    value.cartItems.length==0?
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.shopping_bag_outlined,color: Colors.grey,size: 50,),
          Text(AppLocalizations.of(context)!.noitems,
          style:TextStyle(fontWeight: FontWeight.bold,
          color: Colors.grey,
          fontSize: 30),),
          MaterialButton(onPressed: ()=>Navigator.push(context, 
          MaterialPageRoute(builder: (context)=>Homepage())),
          color: Colors.black,
          child: Text(AppLocalizations.of(context)!.shopnow,style: TextStyle(color: Colors.white)),)
        ],
      ),
    ):
    
       Column(
         children: [
          ListTile(
            tileColor: Colors.black,
            
           // leading: Text("img"),
            title: Padding(
              padding: EdgeInsets.only(left: 30.sp),
              child: Text(AppLocalizations.of(context)!.product,style: TextStyle(
                fontSize: Localizations.of(context, AppLocalizations)!.product.length>16?10.sp:15.sp,fontWeight: FontWeight.bold,color: Colors.white),),
            ),
            trailing: SizedBox(
              width: 170.sp,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
               
                children: [
                  Text(AppLocalizations.of(context)!.price,
                  style: TextStyle(fontSize:12.sp,fontWeight: FontWeight.bold,color: Colors.white ),),
                  Text(AppLocalizations.of(context)!.itemcount,style: TextStyle(
                    fontSize:12.sp,
                    fontWeight: FontWeight.bold,color: Colors.white ))
              
                ],
                
              ),
            ),

          ),
           Expanded(
             child: ListView.builder(
              padding: EdgeInsets.only(bottom: 20.sp),
              itemCount:value.cartItems.length,
              itemBuilder: (context,index)=>ListTile(
                
                
                tileColor:index%2==0? const Color.fromARGB(60, 142, 192, 35):const Color.fromARGB(58, 41, 7, 143),
               leading: Container(
                height: 50.sp,
                padding: EdgeInsets.all(10.sp),
                child: Image.asset(value.cartItems[index].image)),
                title:Text(value.cartItems[index].translatedName?[localeProvider.locale.languageCode]??value.cartItems[index].name),
              //leading: Text(value.cartItems[index].name),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("\$"+value.cartItems[index].price.toString()),
                    SizedBox(width: 30.sp,),
                    IconButton(onPressed: (){value.addCartItem(value.cartItems[index]);
                    final t= value.cartItems[index];
                    print(t.name+t.translatedName.toString());
                    },
                     icon: Icon(Icons.add)),
                    Text(value.cartItems[index].quantity.toString()),
                    IconButton(onPressed: (){value.removeItem(value.cartItems[index]);
                    
                    },
                     icon: Icon(Icons.remove))
                  ],
                ),
              )
                   ),
           ),
           Container(
            height: 100.sp,
            color: Colors.white,
             padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 10.sp),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                Text(AppLocalizations.of(context)!.total,
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp,color: Colors.black),),
                 Center(child: Text("\$"+value.sumofcart().toString(),style: 
                 TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp,color: Colors.black),)),
               ],
             ),
             
           ),
           Padding(
             padding: EdgeInsets.only(top: 20.sp,bottom: 50.sp),
             child: MaterialButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:
              (context)=>Checkoutpage(product:value.cartItems,isFromcart: true,)));
             },
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
             color: Colors.black,
             child: Text(AppLocalizations.of(context)!.proceedtocheckout,
             style: TextStyle(fontWeight: FontWeight.bold,
             color: Colors.white),),
             
             ),
           )
             
         ],
       ),
    )

   );
  }
}