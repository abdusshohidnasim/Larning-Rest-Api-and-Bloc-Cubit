
// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:larning_rest_api_and_statemanagment/get_api.dart';
// import 'package:http/http.dart' as http;
//
// import 'data_model.dart';
//
// void main(){
//   runApp(Myapp());
// }
// class Myapp extends StatelessWidget {
//   const Myapp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: GetApi(),
//     );
//   }
// }
// class GetApi extends StatefulWidget {
//   const GetApi({super.key});
//
//   @override
//   State<GetApi> createState() => _GetApiState();
// }
//
// class _GetApiState extends State<GetApi> {
//   Future<List<Getapi>> Getsatapuii() async {
//
//     try{
//       final respons = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"),
//       headers: {
//         "Accept": "application/json",
//         "User-Agent": "Mozilla/5.0",
//       }
//       );
//       if(respons.statusCode == 200){
//         return getapiFromJson(respons.body);
//       }else{
//         print("Erroe else ${respons.statusCode}");
//         return [];
//       }
//   }catch(e){
//       print("Network Error $e ");
//       return [];
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Get Api"),),
//       body: Column(children: [
//         Expanded(child: FutureBuilder(future: Getsatapuii(), builder: (context,snapshot){
//           if(snapshot.connectionState == ConnectionState.waiting){
//             return Center(child: CircleAvatar(),);
//           };
//           if(snapshot.hasError){
//             return Center(child: Text("Error ${snapshot.error}"),);
//           }
//           if(!snapshot.hasData || snapshot.data!.isEmpty){
//             return Center(child: Text("Data is not Found "),);
//           };
//           var DataVarialbe = snapshot.data!;
//           return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context,index){
//             return Card(child: Text(snapshot.data![index].id.toString()),);
//           });
//         }))
//
//
//       ],),
//     );
//   }
// }
//
