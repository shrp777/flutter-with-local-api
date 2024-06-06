class Fruit {
  final int id;
  final String name;

  const Fruit({required this.id, required this.name});

  //permet de générer un objet Fruit à partir de données JSON
  factory Fruit.fromJson(Map<String, dynamic> json) => Fruit(
        id: json['id'] as int,
        name: json['name'] as String,
      );
}
