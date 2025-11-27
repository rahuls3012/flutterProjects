import 'package:finger_game/l10n/app_localizations.dart';
import 'package:finger_game/pages/cartpage.dart';
import 'package:finger_game/pages/orderpage.dart';
import 'package:finger_game/provider/localeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppDrawer extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Drawer(
        
        child: ListView(
          
          padding: EdgeInsets.zero,
          children: [
            Container(

              height: 150,
              child: DrawerHeader(
                
                
                decoration: 
                
                BoxDecoration( color: Colors.blue),
                child: Text(
                  AppLocalizations.of(context)!.drawertitle,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 24),
                ),
              ),
            ),
             ListTile(
              leading: Icon(Icons.shopping_bag_rounded),
              title: Text(AppLocalizations.of(context)!.myorders),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text(AppLocalizations.of(context)!.cart),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Cartpage()));
              },
            ),
            Consumer<Localeprovider>(builder: (context, value, child) => 
               ExpansionTile(
                leading: Icon(Icons.language),
                title: Text(AppLocalizations.of(context)!.language),
                children: [
                  ListTile(
                   title: Text(   AppLocalizations.of(context)!.english),
                   onTap: ()=>value.changeLoacle(Locale('en')),
                  ),
                  ListTile(
                    title: Text(   AppLocalizations.of(context)!.arabic),
                    onTap: () =>value.changeLoacle(Locale('ar')),
                  )
                ],
              ),
            ),
           
            ListTile(
              leading: Icon(Icons.info),
              title: Text(   AppLocalizations.of(context)!.about),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
