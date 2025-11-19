import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/providers/provider.dart';
class Nextscreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Consumer<Numberprovider>(
      builder:(context,value,child)=>Scaffold(
        body:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Center(child: Text(value.num.toString()),),
            MaterialButton(onPressed: (){
              Navigator.pop(context);
            },
            color: Colors.blue,
            child: Text("click"),)
          ],
        ) ,

      ),
    );
  }
}