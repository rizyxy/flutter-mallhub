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
        emit(StoreError(errorMessage: e.toString()));
      }
    });

    on<FetchMoreStores>((event, emit) async {
      if (!(state is StoreSuccess || state is StoreLoadMoreError)) return;

      final StorePaginated prevStorePaginated;
      final String? cursor;

      if (state is StoreSuccess) {
        prevStorePaginated = (state as StoreSuccess).storePaginated;
        cursor = prevStorePaginated.cursor;
      } else if (state is StoreLoadMoreError) {
        prevStorePaginated = (state as StoreLoadMoreError).storePaginated;
        cursor = prevStorePaginated.cursor;
      } else {
        return;
      }

      if (cursor != null) {
        emit(StoreLoadingMore(stores: prevStorePaginated.stores));

        try {
          final StorePaginated newStorePaginated =
              await _storeRepository.fetchStores(query: {'cursor': cursor});

          final StorePaginated updatedStorePaginated = StorePaginated(stores: [
            ...prevStorePaginated.stores,
            ...newStorePaginated.stores
          ], cursor: newStorePaginated.cursor);

          emit(StoreSuccess(storePaginated: updatedStorePaginated));
        } catch (e) {
          emit(StoreLoadMoreError(
              storePaginated: prevStorePaginated, errorMessage: e.toString()));
        }
      }
    });
  }
}
