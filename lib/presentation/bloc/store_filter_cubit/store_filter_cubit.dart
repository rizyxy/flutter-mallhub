import 'package:flutter_bloc/flutter_bloc.dart';

class StoreFilterCubit extends Cubit<Map<String, dynamic>> {
  StoreFilterCubit() : super({});

  void modifyQuery(String key, dynamic value) {
    state[key] = value;

    emit(state);
  }
}
