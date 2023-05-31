import 'dart:convert';

class Repository {
  final int? id;
  final String? name;

  const Repository({this.id, this.name});

  factory Repository.fromMap(Map<String, dynamic> map) {
    return Repository(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  factory Repository.fromJson(String source) =>
      Repository.fromMap(json.decode(source) as Map<String, dynamic>);
}
