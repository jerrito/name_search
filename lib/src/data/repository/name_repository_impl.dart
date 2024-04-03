import 'package:dartz/dartz.dart';
import 'package:trial_project/core/network/network_connection.dart';
import 'package:trial_project/src/data/datasource/remoteds.dart';
import 'package:trial_project/src/domain/entities/name.dart';
import 'package:trial_project/src/domain/repository/name_repository.dart';

class NameRepositoryImpl extends NameRepository {
  final NameRemoteDatasource remoteDatasource;
  final NetworkInfo networkInfo;

  NameRepositoryImpl(
      {required this.networkInfo, required this.remoteDatasource});
  @override
  Future<Either<String, Name>> getName(Map<String, dynamic> params) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDatasource.getName(params);

        return Right(response);
      } catch (e) {
        return Left(e.toString());
      }
    } else {
      return const Left ("No internet connection");
      
    }
  }
}
