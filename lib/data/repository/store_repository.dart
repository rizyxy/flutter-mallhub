import 'package:flutter_mallhub/data/model/store.dart';

class StoreRepository {
  Future<List<StoreModel>> fetchStores({String? storeName}) async {
    // Mock data
    List<StoreModel> storeDb = [
      StoreModel(
          id: 1,
          name: "Pull and Bear",
          logo: "www.google.com",
          floorId: 1,
          floorName: "1"),
      StoreModel(
          id: 2,
          name: "Zara",
          logo: "www.google.com",
          floorId: 1,
          floorName: "1"),
      StoreModel(
          id: 3,
          name: "Bershka",
          logo: "www.google.com",
          floorId: 1,
          floorName: "1"),
      StoreModel(
          id: 4,
          name: "Executive",
          logo: "www.google.com",
          floorId: 1,
          floorName: "1"),
      StoreModel(
          id: 5,
          name: "This Is April",
          logo: "www.google.com",
          floorId: 1,
          floorName: "1"),
      StoreModel(
          id: 6,
          name: "Coach",
          logo: "www.google.com",
          floorId: 1,
          floorName: "1"),
      StoreModel(
          id: 7,
          name: "Dior",
          logo: "www.google.com",
          floorId: 1,
          floorName: "1"),
      StoreModel(
          id: 8,
          name: "Gucci",
          logo: "www.google.com",
          floorId: 1,
          floorName: "1"),
      StoreModel(
          id: 9,
          name: "Zegna",
          logo: "www.google.com",
          floorId: 1,
          floorName: "1"),
      StoreModel(
          id: 10,
          name: "Massimo Duti",
          logo: "www.google.com",
          floorId: 1,
          floorName: "1"),
    ];

    await Future.delayed(Duration(seconds: 2));

    storeDb.shuffle();

    // Simulate search
    if (storeName != null) {
      return storeDb.where((store) => store.name.contains(storeName)).toList();
    }

    return storeDb.getRange(0, 8).toList();
  }
}
