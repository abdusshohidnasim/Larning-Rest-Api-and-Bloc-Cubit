import 'package:flutter/cupertino.dart';

import 'data_model.dart';
import 'package:http/http.dart' as http;

class ApiProvidr with ChangeNotifier{


  
  Future<List<Getapi>> Getsatapuii() async {

    try{
      final respons = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"),
          headers: {
            "Accept": "application/json",
            "User-Agent": "Mozilla/5.0",
          }
      );
      if(respons.statusCode == 200){
        return getapiFromJson(respons.body);
      }else{
        print("Erroe else ${respons.statusCode}");
        return [];
      }
    }catch(e){
      print("Network Error $e ");
      return [];
    }
  }


}