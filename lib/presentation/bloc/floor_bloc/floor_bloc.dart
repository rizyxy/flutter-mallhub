import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'floor_state.dart';
part 'floor_event.dart';

class FloorBloc extends Bloc<FloorEvent, FloorState> {
  FloorBloc() : super(FloorInitial()) {
    on<FetchFloors>((event, emit) async {
      emit(FloorLoading());

      try {
        await Future.delayed(Duration(seconds: 2));
        emit(FloorSuccess());
      } catch (e) {
        emit(FloorError());
      }
    });
  }
}
