
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:larning_rest_api_and_statemanagment/Bloc/bloc/counterapp/Countera_app_bloc/counter_state.dart';

import 'Countera_app_bloc/counter_bloc.dart';
import 'Countera_app_bloc/counter_event.dart';

void main() {
  return runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MultiBlocProvider(
            providers: [
          BlocProvider<CounterBloc>(create: (context)=>CounterBloc())
        ], child: MyHomePage())
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("Builder");
    final Counterblocobjecet = context.read<CounterBloc>();
    return Scaffold(
      body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc,CounterState>(builder: (context,state){
              return Text("Count : ${state.countervalu}");
            }),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: (){
              Counterblocobjecet.add(Increment());
            }, child: Text("Encremaent ")),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: (){
              Counterblocobjecet.add(Decrement());
            }, child: Text("Decremaent ")),
          ])),
    );
  }
}
