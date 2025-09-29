import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'store_state.dart';
part 'store_event.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreBloc() : super(StoreInitial()) {
    on<FetchStores>((event, emit) async {
      emit(StoreLoading());

      try {
        await Future.delayed(Duration(seconds: 2));
        emit(StoreSuccess());
      } catch (e) {
        emit(StoreError());
      }
    });
  }
}
