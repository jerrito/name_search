import 'package:equatable/equatable.dart';

class Name extends Equatable {
  final String? name;
  final num? count, age;
  const Name({required this.name,required this.age,required  this.count});
  
  @override
  List<Object?> get props => [name,count,age];
  
}
