part of 'store_query_bloc.dart';

sealed class StoreQueryState extends Equatable {
  const StoreQueryState();

  @override
  List<Object?> get props => [];
}

class StoreQueryInitial extends StoreQueryState {}

class StoreQueryLoading extends StoreQueryState {}

class StoreQueryLoadingMore extends StoreQueryState {
  final List<StoreModel> stores;

  const StoreQueryLoadingMore({required this.stores});

  @override
  List<Object?> get props => [stores];
}

class StoreQuerySuccess extends StoreQueryState {
  final List<StoreModel> stores;

  const StoreQuerySuccess({required this.stores});

  @override
  List<Object?> get props => [stores];
}

class StoreQueryError extends StoreQueryState {}
