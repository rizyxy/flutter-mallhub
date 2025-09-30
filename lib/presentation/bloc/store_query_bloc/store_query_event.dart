part of 'store_query_bloc.dart';

sealed class StoreQueryEvent extends Equatable {
  const StoreQueryEvent();

  @override
  List<Object?> get props => [];
}

class FetchStoreQuery extends StoreQueryEvent {
  final Map<String, dynamic> query;

  const FetchStoreQuery({required this.query});

  @override
  List<Object?> get props => [query];
}

class FetchMoreStoreQuery extends StoreQueryEvent {
  final Map<String, dynamic> query;

  const FetchMoreStoreQuery({required this.query});

  @override
  List<Object?> get props => [query];
}
