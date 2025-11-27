import 'package:finger_game/constraints.dart';
import 'package:finger_game/l10n/app_localizations.dart';
import 'package:finger_game/provider/productprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Category extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CategoryState();
  }
}

class CategoryState extends State<Category> {
 
  List<Map<String, String>> Ilist = [];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    
      Ilist=[{"key":"all","label":AppLocalizations.of(context)!.all},
      {"key":"men","label":AppLocalizations.of(context)!.men},
      {"key":"women","label":AppLocalizations.of(context)!.women},
      {"key":"shoes","label":AppLocalizations.of(context)!.shoes},
      {"key":"electronics","label":AppLocalizations.of(context)!.electronics},
      {"key":"clothes","label":AppLocalizations.of(context)!.clothes}];
    
    
    return SizedBox(
      height: 40,

      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: Ilist.length,
        itemBuilder: (context, index) => buildCategory(index),
      ),
    );
  }

  Widget buildCategory(int index) {
    return Consumer<Productprovider>(builder: (context, value, child) => 
       GestureDetector(
        onTap: () {
         value.categoryFilter(Ilist[index]["key"]!);
         value.setSelectedIndex(index);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Ilist[index]["label"]!,
              style: TextStyle(
                color:value.selectedIndex==index?Colors.black: kTextColor,
              ),),
              Container(
                height: 3,
                width: 30,
      
                color: value.selectedIndex == index ? Colors.black : Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}