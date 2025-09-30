import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mallhub/data/model/floor.dart';
import 'package:flutter_mallhub/data/repository/floor_repository.dart';

part 'floor_state.dart';
part 'floor_event.dart';

class FloorBloc extends Bloc<FloorEvent, FloorState> {
  final FloorRepository _floorRepository = FloorRepository();

  FloorBloc() : super(FloorInitial()) {
    on<FetchFloors>((event, emit) async {
      emit(FloorLoading());

      try {
        List<FloorModel> floors = await _floorRepository.fetchFloors();

        emit(FloorSuccess(floors: floors));
      } catch (e) {
        emit(FloorError());
      }
    });
  }
}
