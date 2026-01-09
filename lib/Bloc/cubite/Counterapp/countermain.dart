import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:larning_rest_api_and_statemanagment/Bloc/cubite/Counterapp/counter_cubit.dart';


void main() {
  return runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MultiBlocProvider(providers: [
      BlocProvider(create: (context)=>CounterCubit())
    ], child:  Myhomepage()));
  }
}

class Myhomepage extends StatelessWidget {
  const Myhomepage({super.key});
  @override
  Widget build(BuildContext context) {
    final CounterCubitObject = context.read<CounterCubit>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit,int>(builder: (context,count){
              return Text("Counter : ${count}");
            }),

            ElevatedButton(onPressed: (){
              CounterCubitObject.increment();
            }, child: Text("Increment")),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: (){
              CounterCubitObject.decrement();
            }, child: Text("Decrement")),
          ],
        ),
      ),
    );
  }
}
