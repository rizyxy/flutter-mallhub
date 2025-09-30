import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mallhub/data/model/store.dart';
import 'package:flutter_mallhub/data/repository/store_repository.dart';

part 'store_query_state.dart';
part 'store_query_event.dart';

class StoreQueryBloc extends Bloc<StoreQueryEvent, StoreQueryState> {
  final StoreRepository _storeRepository = StoreRepository();

  StoreQueryBloc() : super(StoreQueryInitial()) {
    on<FetchStoreQuery>((event, emit) async {
      emit(StoreQueryLoading());

      try {
        List<StoreModel> stores =
            await _storeRepository.fetchStores(query: event.query);

        emit(StoreQuerySuccess(stores: stores));
      } catch (e) {
        emit(StoreQueryError());
      }
    });

    on<FetchMoreStoreQuery>((event, emit) async {
      List<StoreModel> prevStores = (state as StoreQuerySuccess).stores;

      emit(StoreQueryLoadingMore(stores: prevStores));

      try {
        List<StoreModel> newStores =
            await _storeRepository.fetchStores(query: event.query);

        prevStores.addAll(newStores);

        emit(StoreQuerySuccess(stores: prevStores));
      } catch (e) {
        emit(StoreQueryError());
      }
    });
  }
}
