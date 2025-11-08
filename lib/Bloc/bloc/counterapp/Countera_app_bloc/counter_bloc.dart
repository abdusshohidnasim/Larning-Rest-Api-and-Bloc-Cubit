import 'package:bloc/bloc.dart';
import 'package:larning_rest_api_and_statemanagment/Bloc/bloc/counterapp/Countera_app_bloc/counter_event.dart';
import 'package:larning_rest_api_and_statemanagment/Bloc/bloc/counterapp/Countera_app_bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent,CounterState>{
  CounterBloc(): super(CounterState(countervalu: 0)){
    on<Increment>((event,emit){
      emit(CounterState(countervalu: state.countervalu+1));
    });

    on<Decrement>((event,emit){
      emit(CounterState(countervalu: state.countervalu-1));
    });
  }


}