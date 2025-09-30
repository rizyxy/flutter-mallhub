part of 'floor_bloc.dart';

sealed class FloorEvent extends Equatable {
  const FloorEvent();

  @override
  List<Object?> get props => [];
}

class FetchFloors extends FloorEvent {}
