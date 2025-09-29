part of 'store_bloc.dart';

sealed class StoreEvent extends Equatable {
  const StoreEvent();

  @override
  List<Object?> get props => [];
}

class FetchStores extends StoreEvent {}

class FetchMoreStores extends StoreEvent {}
