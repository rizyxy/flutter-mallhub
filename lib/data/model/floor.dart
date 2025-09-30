// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FloorModel {
  int id;
  String name;
  FloorModel({
    required this.id,
    required this.name,
  });

  FloorModel copyWith({
    int? id,
    String? name,
  }) {
    return FloorModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  factory FloorModel.fromMap(Map<String, dynamic> map) {
    return FloorModel(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  factory FloorModel.fromJson(String source) =>
      FloorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FloorModel(id: $id, name: $name)';

  @override
  bool operator ==(covariant FloorModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
