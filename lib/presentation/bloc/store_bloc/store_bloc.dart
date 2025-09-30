import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mallhub/data/model/store.dart';
import 'package:flutter_mallhub/data/paginated/store_paginated.dart';
import 'package:flutter_mallhub/data/repository/store_repository.dart';

part 'store_state.dart';
part 'store_event.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  final StoreRepository _storeRepository = StoreRepository();

  StoreBloc() : super(StoreInitial()) {
    on<FetchStores>((event, emit) async {
      emit(StoreLoading());

      try {
        StorePaginated storePaginated = await _storeRepository.fetchStores();

        emit(StoreSuccess(storePaginated: storePaginated));
      } catch (e) {
        emit(StoreError());
      }
    });

    on<FetchMoreStores>((event, emit) async {
      if (state is! StoreSuccess) return;

      StoreSuccess prevState = state as StoreSuccess;
      StorePaginated prevStorePaginated = prevState.storePaginated;

      if (prevStorePaginated.cursor != null) {
        emit(StoreLoadingMore(stores: prevStorePaginated.stores));

        try {
          StorePaginated newStorePaginated = await _storeRepository
              .fetchStores(query: {'cursor': prevStorePaginated.cursor});

          StorePaginated updatedStorePaginated = StorePaginated(stores: [
            ...prevStorePaginated.stores,
            ...newStorePaginated.stores
          ], cursor: newStorePaginated.cursor);

          emit(StoreSuccess(storePaginated: updatedStorePaginated));
        } catch (e) {
          print(e.toString());
          emit(StoreError());
        }
      }
    });
  }
}
