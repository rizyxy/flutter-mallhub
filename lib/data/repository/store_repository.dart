import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mallhub/data/model/store.dart';
import 'package:http/http.dart' as http;

class StoreRepository {
  Future<List<StoreModel>> fetchStores({Map<String, dynamic>? query}) async {
    final Uri uri = Uri.parse(dotenv.get(
        'SERVER_URL?name=${query?['storeName']}&floor_id=${query?['floorId']}'));

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception();
    }

    final data = json.decode(response.body);

    List<StoreModel> stores =
        (data as List).map((map) => StoreModel.fromMap(map)).toList();

    return stores;
  }
}
