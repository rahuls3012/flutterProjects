import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Hello Flutter',
      style: TextStyle(color: Colors.white,
      fontWeight: FontWeight.bold),),
      backgroundColor: Colors.orange,
      centerTitle: true,),
      // body: 
      // Center(child: Container(
      //   height: 400,
      //    width: 400,
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(10),
      //     color: Colors.blueAccent,),
          
      //     child:Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         Container(
      //           height: 100,
      //           width: 100,
      //           decoration: BoxDecoration(
      //             color: Colors.red,
      //             borderRadius: BorderRadius.circular(10)
      //           ),
      //         ),
      //          Container(
      //           height: 100,
      //           width: 100,
      //           decoration: BoxDecoration(
      //             color: Colors.red,
      //             borderRadius: BorderRadius.circular(10)
      //           ),
      //         )
      //       ],
      //     ),
      //     )
          body: Column(
            children: [
             Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 250, 248, 248),
             boxShadow:[BoxShadow(spreadRadius: 2,blurRadius: 2,color: Colors.black26)],
              borderRadius: BorderRadius.circular(10)
              
            ),
            height: 100,
            width: double.infinity,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Briyani",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                Text("with Chiken piece and raita"),
                Text("250",
                style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
          ),
             Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 250, 248, 248),
             boxShadow:[BoxShadow(spreadRadius: 2,blurRadius: 2,color: Colors.black26)],
              borderRadius: BorderRadius.circular(10)
              
            ),
            height: 100,
            width: double.infinity,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Briyani",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                Text("with Chiken piece and raita"),
                Text("250",
                style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
          ),
             Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 250, 248, 248),
             boxShadow:[BoxShadow(spreadRadius: 2,blurRadius: 2,color: Colors.black26)],
              borderRadius: BorderRadius.circular(10)
              
            ),
            height: 100,
            width: double.infinity,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Briyani",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                Text("with Chiken piece and raita"),
                Text("250",
                style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
          )
            ],
          )
          
          
         
       ),
    ),

  );
}

