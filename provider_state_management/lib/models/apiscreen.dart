import 'package:flutter/material.dart';
import 'package:provider_state_management/models/apimodel.dart';
import 'apiservice.dart';

class Apiscreen extends StatefulWidget {
  @override
  State<Apiscreen> createState() => _ApiscreenState();
}

class _ApiscreenState extends State<Apiscreen> {
  final api = apiService();
  Product? response;
  TextEditingController tc = TextEditingController();
  TextEditingController tc1 = TextEditingController();
  TextEditingController tc2 = TextEditingController();
  bool isLoading = false; // FIXED: loading should be false initially

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API Integration")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: tc,
              decoration: InputDecoration(
                hintText: "Enter ID",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });

                final result = await api.getpost("/get?id=${tc.text}");

                setState(() {
                  response = result;
                  isLoading = false;
                });
              },
              child: Text("Get Data"),
            ),

            const SizedBox(height: 20),

            // UI STATES
            if (isLoading)
             Text("Loading...")
            else if (response != null)
              ListTile(
                title: Text(response!.name),
                subtitle: Text(response!.course),
              )
            else
              Text("No data"),
            TextField(
             controller: tc1, 
            decoration: InputDecoration(
              label: Text("entername"),
              border: OutlineInputBorder(),
            ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: tc2,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Enter course")
              ),
            ),
            MaterialButton(onPressed: ()async{
              final result=await api.addpost("/enterdetails?name=${tc1.text}&course=${tc2.text}");
              setState(() {
                tc1.clear();
                tc2.clear();
              });
            },
            color: Colors.blueAccent,
            child: Text("submit"),)
          ],
        ),
      ),
    );
  }
}
