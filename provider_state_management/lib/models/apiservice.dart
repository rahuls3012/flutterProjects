import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider_state_management/models/apimodel.dart';
class apiService{
  var client=http.Client();
  String baseurl="http://192.168.1.9:8080/security";
  Future<Product?>getpost(String url)async{
    var uri=Uri.parse(baseurl+url);
    
    var response=await client.get(uri);
    if(response.statusCode==200){
       var json=response.body;
       return productFromJson(json);

    }
  }
  Future<dynamic>addpost(String url)async{
   
    var uri=Uri.parse(baseurl+url);
    var response=await client.post(uri);
    if(response.statusCode==200){
      return response.body;
    }
    

  }
}