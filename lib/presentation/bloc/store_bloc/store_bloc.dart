import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mallhub/data/model/store.dart';
import 'package:flutter_mallhub/data/repository/store_repository.dart';

part 'store_state.dart';
part 'store_event.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreRepository _storeRepository = StoreRepository();

  StoreBloc() : super(StoreInitial()) {
    on<FetchStores>((event, emit) async {
      emit(StoreLoading());

      try {
        List<StoreModel> stores = await _storeRepository.fetchStores();

        emit(StoreSuccess(stores: stores));
      } catch (e) {
        emit(StoreError());
      }
    });

    on<FetchMoreStores>((event, emit) async {
      StoreSuccess prevState = state as StoreSuccess;
      List<StoreModel> prevStores = prevState.stores;

      emit(StoreLoadingMore(stores: prevStores));

      try {
        List<StoreModel> newStores = await _storeRepository.fetchStores();

        prevStores.addAll(newStores);

        emit(StoreSuccess(stores: prevStores));
      } catch (e) {
        emit(StoreError());
      }
    });
  }
}
