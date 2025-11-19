import 'package:finger_game/models/product.dart';
import 'package:finger_game/widgets/Appbar.dart';
import 'package:finger_game/widgets/homeBody.dart';
import 'package:flutter/material.dart';
class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
   bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  List<Product> searchResults = [];
  List<Product> allProducts = products; 
  // Assuming 'products' is your list of all product
   @override
  void initState() {
    super.initState();
    searchResults = allProducts;
  }

  void filterItems(String text) {
    setState(() {
      searchResults = allProducts.where((product) =>
       product.name.toLowerCase().contains(text.toLowerCase())).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: Appbar(title: "Home Page", press: () {
        print("Appbar pressed");
      },
       icon:Icons.menu,
       isSearching: isSearching,
        controller: searchController,
        onSearch: filterItems,
        onSearchPressed: () {
          setState(() {
            isSearching = true;
          });
        },
        onClosePressed: () {
          setState(() {
            isSearching = false;
            searchController.clear();
            searchResults = allProducts;
          });
        },
      ),
      body: Homebody(products:searchResults),
      
    );
  }
}