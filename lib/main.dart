import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:larning_rest_api_and_statemanagment/Model/model.dart';

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
  List<DataModel> DataList = [];

  Future<List<DataModel>> GetData() async {
    var respons = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );
    final Data = jsonDecode(respons.body.toString());
    if (respons.statusCode == 200) {
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
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("Laoding...");
                } else {
                  return ListView.builder(
                    itemCount: DataList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [Text(DataList[index].title.toString())],
                        ),
                      );
                    },
                  );
                }
                ;
              },
            ),
          ),
        ],
      ),
    );
  }
}
