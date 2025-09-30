part of 'store_query_bloc.dart';

sealed class StoreQueryEvent extends Equatable {
  const StoreQueryEvent();

  @override
  List<Object?> get props => [];
}

class FetchStoreQuery extends StoreQueryEvent {
  final String storeName;

  const FetchStoreQuery({required this.storeName});

  @override
  List<Object?> get props => [storeName];
}

class FetchMoreStoreQuery extends StoreQueryEvent {
  final String storeName;

  const FetchMoreStoreQuery({required this.storeName});

  @override
  List<Object?> get props => [storeName];
}
