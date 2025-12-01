import 'package:finger_game/l10n/app_localizations.dart';
import 'package:finger_game/models/product.dart';
import 'package:finger_game/models/sampleproducts.dart';
import 'package:finger_game/provider/productprovider.dart';
import 'package:finger_game/widgets/Appbar.dart';
import 'package:finger_game/widgets/drawer.dart';
import 'package:finger_game/widgets/homeBody.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
 
}

class _HomepageState extends State<Homepage> {
  late final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
   bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  List<Product> searchResults = [];
  List<Product> allProducts = sampleproducts; 
  // Assuming 'products' is your list of all product
  
  @override
  Widget build(BuildContext context) {
    return Consumer<Productprovider>(builder: (context, value, child) =>
       Scaffold(
        key: _scaffoldKey,
        appBar: Appbar(title: AppLocalizations.of(context)!.home,
        sicon: Icons.search,
        
         icon:Icons.menu,
         isSearching: isSearching,
          controller: searchController,
          onSearch: value.filterItems,
          onSearchPressed: () {
            setState(() {
              isSearching = true;
            });
          },
          onClosePressed: () {
            setState(() {
              isSearching = false;
              searchController.clear();
              value.filterItems("");
            });
          },
        ),
        drawer: MyAppDrawer(),
        body: Homebody(products:value.searchResults),
        
      ),
    );
  }
}