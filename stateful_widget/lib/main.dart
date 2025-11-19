import 'package:flutter/material.dart';

void main() {
  runApp(mainApp());
}
class mainApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
return mainAppState();
  }
    
  
}
class mainAppState extends State<mainApp>{
  int data=0;
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           
           
            Text("counter app"),
             Icon(Icons.menu),
          ],
        ),
      ),
      body:Center(child:Column(
        
        children: [
          SizedBox(height: 50,width: double.infinity),
          Text("the number$data"),
          MaterialButton(onPressed: () {
            setState(() {
              data++;
            });
          }, color: Colors.cyan,
          child:Text("increase") ),
          MaterialButton(onPressed: (){
            setState(() {
              data--;
            });
            
          },
          color:Colors.red,
          child: Text("reduce"),
          )
        ],
      ) ) 
    ),
  );
    
  }

}