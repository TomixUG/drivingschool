class Cat {
  final String id;
  final String name;
  final int count;

  Cat({required this.id, required this.name, required this.count});

  Cat.fromMap(Map<String, dynamic> item)
      : id = item["id"],
        name = item["name"],
        count = item["count"];

  Map<String, Object> toMap() {
    return {'id': id, 'name': name, 'count': count};
  }
}
