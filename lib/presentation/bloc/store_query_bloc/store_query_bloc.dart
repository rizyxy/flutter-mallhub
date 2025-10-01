import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mallhub/data/paginated/store_paginated.dart';
import 'package:flutter_mallhub/data/repository/store_repository.dart';

part 'store_query_state.dart';
part 'store_query_event.dart';

class StoreQueryBloc extends Bloc<StoreQueryEvent, StoreQueryState> {
  final StoreRepository _storeRepository = StoreRepository();

  StoreQueryBloc() : super(StoreQueryInitial()) {
    on<FetchStoreQuery>((event, emit) async {
      emit(StoreQueryLoading());

      try {
        StorePaginated storePaginated =
            await _storeRepository.fetchStores(query: event.query);

        emit(StoreQuerySuccess(storePaginated: storePaginated));
      } catch (e) {
        emit(StoreQueryError(errorMessage: e.toString()));
      }
    });

    on<FetchMoreStoreQuery>((event, emit) async {
      if (!(state is StoreQuerySuccess || state is StoreQueryLoadMoreError)) {
        return;
      }

      final StorePaginated prevStorePaginated;
      final String? cursor;

      if (state is StoreQuerySuccess) {
        prevStorePaginated = (state as StoreQuerySuccess).storePaginated;
        cursor = prevStorePaginated.cursor;
      } else if (state is StoreQueryLoadMoreError) {
        prevStorePaginated = (state as StoreQueryLoadMoreError).storePaginated;
        cursor = prevStorePaginated.cursor;
      } else {
        return;
      }

      if (cursor != null) {
        emit(StoreQueryLoadingMore(storePaginated: prevStorePaginated));

        try {
          Map<String, dynamic> query = event.query;
          query['cursor'] = cursor;

          final StorePaginated newStorePaginated =
              await _storeRepository.fetchStores(query: query);

          final StorePaginated updatedStorePaginated = StorePaginated(stores: [
            ...prevStorePaginated.stores,
            ...newStorePaginated.stores
          ], cursor: newStorePaginated.cursor);

          emit(StoreQuerySuccess(storePaginated: updatedStorePaginated));
        } catch (e) {
          emit(StoreQueryLoadMoreError(
              storePaginated: prevStorePaginated, errorMessage: e.toString()));
        }
      }
    });
  }
}
