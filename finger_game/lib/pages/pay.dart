import 'package:finger_game/widgets/btn.dart';
import 'package:flutter/material.dart';

class Pay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
     
      appBar: AppBar(title:Text("Pay Page",
      style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),),
      leading: Icon(Icons.arrow_back),
     
      actions: [Icon(Icons.shopping_cart),
      SizedBox(width: 20,),
      IconButton(icon: Icon(Icons.search), onPressed: () {
        print("search pressed");
      },)],
      elevation: 1,
      backgroundColor: const Color.fromARGB(255, 92, 143, 238),
      bottom:PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: TabBar(
           labelColor: Colors.amber,
                tabs: [
                  Tab(icon: Icon(Icons.home), text: "Home"),
                  Tab(icon: Icon(Icons.person), text: "Profile"),
                  Tab(icon: Icon(Icons.settings), text: "Settings"),
                ],
              ),
        ),
      ),
       
       centerTitle: true,),
       body:ListView(
        children: [
          CustomButton(text: "page 1", onPressed: () {  },),
           CustomButton(text: "page 2", onPressed: () {  },),
            CustomButton(text: "page 3", onPressed: () {  },),
            CustomButton(text: "page 4", onPressed: () {  },),
            CustomButton(text: "page 5", onPressed: () {  },),
        ],
       )
     ) );
  }
}
