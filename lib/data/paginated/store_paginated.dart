// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_mallhub/data/model/store.dart';

class StorePaginated {
  final List<StoreModel> stores;
  String? cursor;
  StorePaginated({
    required this.stores,
    this.cursor,
  });

  StorePaginated copyWith({
    List<StoreModel>? stores,
    String? cursor,
  }) {
    return StorePaginated(
      stores: stores ?? this.stores,
      cursor: cursor ?? this.cursor,
    );
  }

  factory StorePaginated.fromMap(Map<String, dynamic> map) {
    return StorePaginated(
      stores: List<StoreModel>.from(
        (map['data'] as List)
            .map(
              (x) => StoreModel.fromMap(x as Map<String, dynamic>),
            )
            .toList(),
      ),
      cursor: map['next_cursor'] != null ? map['next_cursor'] as String : null,
    );
  }

  factory StorePaginated.fromJson(String source) =>
      StorePaginated.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'StorePaginated(stores: $stores, cursor: $cursor)';

  @override
  bool operator ==(covariant StorePaginated other) {
    if (identical(this, other)) return true;

    return listEquals(other.stores, stores) && other.cursor == cursor;
  }

  @override
  int get hashCode => stores.hashCode ^ cursor.hashCode;
}
