import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:larning_rest_api_and_statemanagment/Demo_Trail/Bloc/state.dart';

import 'event.dart';

class ScandCounterBloc extends Bloc<SecentEvent, ScentCounterState> {
  ScandCounterBloc() : super(ScentCounterState(Countervalu: 0)) {
    on<SecentIncrement>((event, emit) {
      emit(ScentCounterState(Countervalu: state.Countervalu + 1));
    });
    on<SecentDecrement>((event, emit) {
      emit(ScentCounterState(Countervalu: state.Countervalu - 1));
    });
  }
}
