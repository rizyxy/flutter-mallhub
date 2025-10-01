part of 'store_bloc.dart';

sealed class StoreState extends Equatable {
  const StoreState();

  @override
  List<Object?> get props => [];
}

class StoreInitial extends StoreState {}

class StoreLoading extends StoreState {}

class StoreLoadingMore extends StoreState {
  final List<StoreModel> stores;

  const StoreLoadingMore({required this.stores});

  @override
  List<Object?> get props => [stores];
}

class StoreSuccess extends StoreState {
  final StorePaginated storePaginated;

  const StoreSuccess({required this.storePaginated});

  @override
  List<Object?> get props => [storePaginated];
}

class StoreError extends StoreState {
  final String? errorMessage;

  const StoreError({this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class StoreLoadMoreError extends StoreState {
  final StorePaginated storePaginated;
  final String? errorMessage;

  const StoreLoadMoreError({required this.storePaginated, this.errorMessage});

  @override
  List<Object?> get props => [storePaginated, errorMessage];
}
