import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mallhub/data/paginated/store_paginated.dart';
import 'package:http/http.dart' as http;

class StoreRepository {
  Future<StorePaginated> fetchStores({Map<String, dynamic>? query}) async {
    final Uri uri = Uri.parse(
        '${dotenv.get('SERVER_URL')}/stores?cursor=${query?['cursor']}');

    final response =
        await http.get(uri, headers: {'ngrok-skip-browser-warning': 'true'});

    if (response.statusCode != 200) {
      throw Exception();
    }

    final data = json.decode(response.body);

    final StorePaginated storePaginated = StorePaginated.fromMap(data);

    return storePaginated;
  }
}
