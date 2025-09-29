part of 'store_bloc.dart';

sealed class StoreState extends Equatable {
  const StoreState();

  @override
  List<Object?> get props => [];
}

class StoreInitial extends StoreState {}

class StoreLoading extends StoreState {}

class StoreLoadingMore extends StoreState {}

class StoreSuccess extends StoreState {}

class StoreError extends StoreState {}
