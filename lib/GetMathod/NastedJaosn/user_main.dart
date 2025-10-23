import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:larning_rest_api_and_statemanagment/GetMathod/Api_photo/photo.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

void main(){
  runApp(MyApp()); 
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: NastedJason());
  }
}
class NastedJason extends StatefulWidget {
  const NastedJason({super.key});

  @override
  State<NastedJason> createState() => _NastedJasonState();
}

class _NastedJasonState extends State<NastedJason> {
  Future<List<UserDataModel>> Getnestedjason() async {
    final respons = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"),headers: {
      "Accept": "application/json",
      "User-Agent": "Mozilla/5.0",
    });

    try{
      if(respons.statusCode == 200){
        return  userDataModelFromJson(respons.body);
      }else{
        print("Statuc Code ${respons.statusCode}");
        return [];
      }
      
    }catch(e){
      print("Error Throw $e");
      return [];
      
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        FutureBuilder(future: Getnestedjason(), builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircleAvatar(),);
          }
          if(!snapshot.hasData || snapshot.data!.isEmpty){

          }
          return Container(child:  Text("Naiem "),);
        })
      ],),
    );
  }
}
