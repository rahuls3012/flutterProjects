import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/providers/todoProvider.dart';

class Todoviewer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ToDoViewer"),),
      body: Consumer<Todoprovider>(builder:(context,value,child)=>ListView.builder(itemCount: value.todo.length
      ,itemBuilder: (context, index) =>Padding(padding: EdgeInsets.all(8.0),
      child: Container(width: double.infinity,
      //height: 50,
      decoration: BoxDecoration(
         color: value.todo[index].isDone?const Color.fromARGB(255, 9, 82, 90): const Color.fromARGB(255, 54, 239, 220) ,
       borderRadius: BorderRadius.circular(10)

      ),
     
      child: Row(
       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(value.todo[index].title, overflow: TextOverflow.ellipsis,   // or wrap
              maxLines: 5,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.check_box,color:value.todo[index].isDone?Colors.green:Colors.transparent,
            fontWeight: FontWeight.bold,),
          )
        ],
      )),) ,))
    );
  }
}