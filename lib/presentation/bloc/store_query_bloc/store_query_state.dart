part of 'store_query_bloc.dart';

sealed class StoreQueryState extends Equatable {
  const StoreQueryState();

  @override
  List<Object?> get props => [];
}

class StoreQueryInitial extends StoreQueryState {}

class StoreQueryLoading extends StoreQueryState {}

class StoreQueryLoadingMore extends StoreQueryState {
  final StorePaginated storePaginated;

  const StoreQueryLoadingMore({required this.storePaginated});

  @override
  List<Object?> get props => [storePaginated];
}

class StoreQuerySuccess extends StoreQueryState {
  final StorePaginated storePaginated;

  const StoreQuerySuccess({required this.storePaginated});

  @override
  List<Object?> get props => [storePaginated];
}

class StoreQueryError extends StoreQueryState {
  final String? errorMessage;

  const StoreQueryError({this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class StoreQueryLoadMoreError extends StoreQueryState {
  final StorePaginated storePaginated;
  final String? errorMessage;

  const StoreQueryLoadMoreError(
      {required this.storePaginated, this.errorMessage});

  @override
  List<Object?> get props => [storePaginated, errorMessage];
}
