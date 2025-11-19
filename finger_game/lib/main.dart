import 'package:finger_game/constraints.dart';
import 'package:finger_game/pages/homePage.dart';
import 'package:finger_game/pages/pay.dart';
import 'package:finger_game/widgets/btn.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
     visualDensity: VisualDensity.adaptivePlatformDensity,
     textTheme:TextTheme(
      bodyLarge: TextStyle(color: kTextColor),
      bodyMedium: TextStyle(color: kTextColor),
     )
    ),
    home:Homepage()
  ));
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("hello"), backgroundColor: Colors.amber),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Secondpage(),
              ),
            );
          },
            color: Colors.black,
          child: Text("click",
          style:TextStyle(color: Colors.amber),
          ),
        
        ),
      ),
    );
  }
}
class Secondpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SecondpageState();
  }
}
class SecondpageState extends State<Secondpage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("secondPage", style: TextStyle(color: Colors.amber)),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: MaterialButton(onPressed: (){
            Navigator.pop(context);
          },
          color: Colors.amber,
          textColor: Colors.black,
          child: Text("Go Back"),
          ),
          ),
      ),
    );
  }
}
  