import 'package:finger_game/l10n/app_localizations.dart';
import 'package:finger_game/models/orderlist.dart';
import 'package:finger_game/models/product.dart';
import 'package:finger_game/provider/localeprovider.dart';
import 'package:finger_game/provider/orderlistprovider.dart';
import 'package:finger_game/widgets/Appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:finger_game/provider/translate.dart';
class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Orderlistprovider>(builder: (context, value, child) => 
      Scaffold(
        appBar: Appbar(title:AppLocalizations.of(context)!.myorders,press: () => Navigator.pop(context),),
        body: Column(
         
          children: [
            
            Expanded(
            child: ListView.builder(
              itemCount: value.orderItems.length,
              itemBuilder: (context,index){
                final OrderList orderitem=value.orderItems[index];
              
              return Container(

                margin: EdgeInsets.all(4.sp),
                 decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.sp),
                  border: Border.all(color: Colors.black)
                 ),
                child: ExpansionTile(
                  backgroundColor: const Color.fromARGB(255, 234, 234, 234),
                
                
                title:Text('${AppLocalizations.of(context)!.order} ${index+1}:') ,
                subtitle:Text('ID :${orderitem.orderId}'),
                trailing: SizedBox(
                  width: 180.sp,
                  child: Padding(
                    padding: EdgeInsets.only(top: 15.sp),
                    child: Row(
                     crossAxisAlignment: CrossAxisAlignment.end,
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
                      children: [
                       
                        Text('${AppLocalizations.of(context)!.total}: \$${orderitem.totalAmount.toString()}'),
                        //  SizedBox(width: 10,),
                         Text(DateFormat('dd/MM/yyy').format(orderitem.orderDate)),
                        // SizedBox(width: 10,),
                         GestureDetector(
                         
                          onTap: (){
                          
                          value.clearOrders(index);
                         }, child: Icon(Icons.delete,color: Colors.red,))
                      ],
                    ),
                  ),
                ),
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: orderitem.orderedProduct.length,
                    itemBuilder:(context,pindex){
                    final Product orderedProduct=  orderitem.orderedProduct[pindex];
                      return ListTile(
                       
                        leading: Text('${pindex+1}'),
                        title:Consumer<Localeprovider>(builder: (context, localeProvider, child)=>
                         Text(
                          ProductTranslationHelper.getTranslatedName(orderedProduct, localeProvider.currentLanguageCode),
                         )
                        ),
                        trailing: SizedBox(
                          width: 150.sp,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text(orderedProduct.quantity.toString()),
                            Text('${orderedProduct.price*orderedProduct.quantity}')],
                            
                          ),
                        ),
                        
                      );
                    })
                ],
                ),
              );
            
                
               
            }
            )
            ),
          ],
        ),
      ),
    );
  }
}