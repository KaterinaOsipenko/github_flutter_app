/// repository model

class Repository {
  final int id;
  final String name;
  bool _isFavourite;

  bool get isFavourite => _isFavourite;

  set isFavourite(bool value) {
    _isFavourite = value;
  }

  Repository({
    required this.id,
    required this.name,
    bool isFavourite = false,
  }) : _isFavourite = isFavourite;

  factory Repository.fromMap(Map<String, dynamic> map) {
    return Repository(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  factory Repository.fromJson(Map<String, dynamic> source) =>
      Repository.fromMap(source);
}
