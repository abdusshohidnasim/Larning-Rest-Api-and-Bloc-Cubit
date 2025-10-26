import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:larning_rest_api_and_statemanagment/Push%20Mathod/Redgistation/provider.dart';
import 'package:larning_rest_api_and_statemanagment/Push%20Mathod/Redgistation/registationScreen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=> PushProvider())
  ],child: MyApp(),));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Registationscreen(),);
  }
}
