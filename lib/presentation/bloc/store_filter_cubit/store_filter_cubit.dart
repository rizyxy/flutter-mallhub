import 'package:flutter_bloc/flutter_bloc.dart';

class StoreFilterCubit extends Cubit<Map<String, dynamic>> {
  StoreFilterCubit() : super({});

  void modifyQuery(String key, dynamic value) {
    final Map<String, dynamic> newState = Map.from(state);

    if (newState.containsKey(key) && newState[key] == value) {
      newState.remove(key);
    } else {
      newState[key] = value;
    }

    emit(newState);
  }
}
