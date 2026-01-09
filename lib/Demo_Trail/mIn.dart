import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:larning_rest_api_and_statemanagment/Demo_Trail/Bloc/event.dart';
import 'package:larning_rest_api_and_statemanagment/Demo_Trail/Bloc/state.dart';

import 'Bloc/bloc.dart';

void main(){
  runApp(Myapp()); 
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(providers: [
      BlocProvider(create: (context)=> ScandCounterBloc()),
    ], child: Homepaze(),),);
  }
}
class Homepaze extends StatelessWidget {
  const Homepaze({super.key});

  @override
  Widget build(BuildContext context) {
    final BlocModel = context.read<ScandCounterBloc>();
    return Scaffold(

      body: Column(children: [
        Text("Naiem Hassan Naiem "),
       BlocBuilder<ScandCounterBloc,ScentCounterState>(
           builder: (context,state){
         return Text("Counter: ${state.Countervalu.toString()}");
       }),
    SizedBox(height: 50,),
        ElevatedButton(onPressed: (){
          BlocModel.add(SecentIncrement());
        }, child: Text("Incement")),
        SizedBox(height: 50,),
        ElevatedButton(onPressed: (){
          BlocModel.add(SecentDecrement());
        }, child: Text("Decremt"))
      ],),
    );
  }
}

