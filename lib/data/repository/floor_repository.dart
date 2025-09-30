import 'package:flutter_mallhub/data/model/floor.dart';

class FloorRepository {
  Future<List<FloorModel>> fetchFloors() async {
    //Mock Data
    List<FloorModel> floorDb = [
      FloorModel(id: 1, name: '1'),
      FloorModel(id: 2, name: '2'),
      FloorModel(id: 3, name: '3')
    ];

    //Simulate API Call
    await Future.delayed(const Duration(seconds: 2));

    return floorDb;
  }
}
