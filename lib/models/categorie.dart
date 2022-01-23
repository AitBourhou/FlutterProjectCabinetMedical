import 'package:meta/meta.dart';
class Categorie {
  final int id;
  final String name;
  final String icon;



  Categorie ({
    this.id,
    this.name,
    this.icon


  });
  factory Categorie.fromJson(Map<String ,dynamic> jsonData)
  {
    return Categorie(
      id: jsonData['id'],
      name: jsonData['name'],
      icon: jsonData['icon'],

    );

  }
}
