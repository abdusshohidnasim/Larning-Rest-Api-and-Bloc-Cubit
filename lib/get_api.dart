import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'GetMathod/Model/Get_Api_Model/model.dart';

void main() {
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHome());
  }
}
class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}
class _MyHomeState extends State<MyHome> {
  //String BaseUril = "https://jsonplaceholder.typicode.com/posts";




  Future<List<DataModel>> GetData() async {

    var respons = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );
    final Data = jsonDecode(respons.body.toString());

    if (respons.statusCode == 200) {
      List<DataModel> DataList = [];

      for (Map<String,dynamic> v in Data) {
        DataList.add(DataModel.fromJson(v));
      }
      return DataList;
    } else {
      return [];
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(

        children: [
          Expanded(
            child: FutureBuilder(
              future: GetData(),
              builder: (context,AsyncSnapshot<List<DataModel>> snapshot) {
                if (!snapshot.hasData) {
                  return Text("Laoding...");
                } else {
                  return ListView.builder(
                //   item = snapshot.data![index];
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [Text(snapshot.data![index].title.toString()),],
                        ),
                      );
                    },
                  );
                }

              },
            ),
          ),
        ],
      ),
    );
  }
}
