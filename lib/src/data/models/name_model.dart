import 'package:trial_project/src/domain/entities/name.dart';

class NameModel extends Name {
  const NameModel({
    required super.name,
    required super.age,
    required super.count,
  });

  factory NameModel.fromJson(Map<String, dynamic> json) => NameModel(
        name: json["name"],
        age: json["age"],
        count: json["count"],
      );

  Map<String, dynamic> toMap()=> 
     {
      "name": name,
      "age":age,
      "count":count
    };
  
}
