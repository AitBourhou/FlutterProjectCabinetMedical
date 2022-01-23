import 'package:app_cabinet_medic/models/doctor_module.dart';

class Categories
{

  List<dynamic> categories;

  Categories({this.categories});
  factory Categories.fromJson(Map<String,dynamic> jsonData)
  {
    return Categories(

      categories: jsonData['categorie'],
    );
  }
}