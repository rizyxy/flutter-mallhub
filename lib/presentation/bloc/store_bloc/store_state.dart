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
  final List<StoreModel> stores;

  const StoreSuccess({required this.stores});

  @override
  List<Object?> get props => [stores];
}

class StoreError extends StoreState {}
