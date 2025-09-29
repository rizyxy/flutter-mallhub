// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StoreModel {
  final String id;
  final String name;
  final String logo;
  final String floorId;
  final String floorName;
  StoreModel({
    required this.id,
    required this.name,
    required this.logo,
    required this.floorId,
    required this.floorName,
  });

  StoreModel copyWith({
    String? id,
    String? name,
    String? logo,
    String? floorId,
    String? floorName,
  }) {
    return StoreModel(
      id: id ?? this.id,
      name: name ?? this.name,
      logo: logo ?? this.logo,
      floorId: floorId ?? this.floorId,
      floorName: floorName ?? this.floorName,
    );
  }

  factory StoreModel.fromMap(Map<String, dynamic> map) {
    return StoreModel(
      id: map['id'].toString(),
      name: map['name'] as String,
      logo: map['logo'] as String,
      floorId: map['floor']['floor_id'].toString(),
      floorName: map['floor']['floor_name'] as String,
    );
  }

  factory StoreModel.fromJson(String source) =>
      StoreModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StoreModel(id: $id, name: $name, logo: $logo, floorId: $floorId, floorName: $floorName)';
  }

  @override
  bool operator ==(covariant StoreModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.logo == logo &&
        other.floorId == floorId &&
        other.floorName == floorName;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        logo.hashCode ^
        floorId.hashCode ^
        floorName.hashCode;
  }
}
