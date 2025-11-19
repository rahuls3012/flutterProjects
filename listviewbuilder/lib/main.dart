import 'package:flutter/material.dart';

void main() {
  runApp(mainApp());
}

class mainApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return mainAppstate();
   
  }
}
class mainAppstate extends State<mainApp>{
  List<String>menu=["marry","sorry","plato"];
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.cyan,
        title:Text("ListView_Builder"),),
      body: ListView.builder(
        itemCount: 40,
        itemBuilder: (context,index){
      return Text("hello this is flutter...${index+1}");
      
      }
      ),
    )
   );
  }
}