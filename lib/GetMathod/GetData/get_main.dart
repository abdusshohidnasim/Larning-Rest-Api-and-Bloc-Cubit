import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:larning_rest_api_and_statemanagment/get_api.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'Provider_funtion.dart';
import 'data_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ApiProvidr())],
      child: Myapp(),
    ),
  );
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: GetApi());
  }
}

class GetApi extends StatefulWidget {
  const GetApi({super.key});

  @override
  State<GetApi> createState() => _GetApiState();
}
class _GetApiState extends State<GetApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Get Api")),
      body: Consumer<ApiProvidr>(
        builder: (context, ApiModel, child) {
          return FutureBuilder(
            future: ApiModel.Getsatapuii(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircleAvatar());
              }
              if (snapshot.hasError) {
                return Text("hass error");
              }
              if (snapshot.data!.isEmpty) {
                return Text("Data is Empty");
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  var item = snapshot.data![index];
                  return ListTile(
                    title: Text(
                      " Titel: \n ${item.title}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Subtitel ${item.body}"),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
