import 'package:dartz/dartz.dart';
import 'package:trial_project/core/usecase/usecase.dart';
import 'package:trial_project/src/domain/entities/name.dart';
import 'package:trial_project/src/domain/repository/name_repository.dart';

class GetName extends UseCases<Name, Map<String, dynamic>> {
  final NameRepository repository;
  GetName({required this.repository});
  @override
  Future<Either<String, Name>> call(Map<String, dynamic> params) async {
    return await repository.getName(params);
  }
}
