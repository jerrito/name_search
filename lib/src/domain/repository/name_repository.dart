import 'package:dartz/dartz.dart';
import 'package:trial_project/src/domain/entities/name.dart';

abstract class NameRepository {
  Future<Either<String, Name>> getName(Map<String, dynamic> params);
}
