import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/nextScreen.dart';
import 'package:provider_state_management/providers/provider.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Numberprovider>(
      builder: (context, value, child) => Scaffold(appBar: AppBar(title: Text("Provider")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(value.num.toString()),
            MaterialButton(onPressed: (){
              value.decrement();
            },
            color: Colors.blue,
            child: Text("decrement"),
            ),
            MaterialButton(onPressed: (){
         Navigator.push(
  context,
  PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 350),
    pageBuilder: (_, __, ___) => Nextscreen(),
    transitionsBuilder: (_, animation, __, child) {
     
      final fadeAnimation =
          Tween(begin: 0.0, end: 1.0).animate(animation);

      return FadeTransition(
        opacity: fadeAnimation,
        child:child,
      );
    },
  ),
);

            },
            minWidth: 50,
            height: 40,

            color: Colors.blueGrey,
            child: RichText(text: TextSpan(text: "Click ",
            children: [
              TextSpan(text: ">",style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ))
            ]
            ),
            ),)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed:()
      {
        value.increment();
      },
    
      child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      
      ),
    );
  }
}
