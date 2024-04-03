import 'dart:convert';
import 'dart:io';

import 'package:trial_project/core/network/network_connection.dart';
import 'package:trial_project/core/urls/url.dart';
import 'package:trial_project/src/data/models/name_model.dart';
import 'package:trial_project/src/domain/entities/name.dart';
import 'package:http/http.dart' as http;

abstract class NameRemoteDatasource {
  Future<Name> getName(Map<String, dynamic> params);
}

class NameRemoteDatasourceImpl implements NameRemoteDatasource {
  final NetworkInfo networkInfo;
  final http.Client client;
  final URL url;

  NameRemoteDatasourceImpl(
      {required this.url, required this.client, required this.networkInfo});

  @override
  Future<NameModel> getName(Map<String, dynamic> params) async {
    final uri = url.returnUri(queryParameters: params);
    final response = await client.get(uri);
    final decodedResponse = json.decode(response.body);
    print(decodedResponse);
    if (response.statusCode == HttpStatus.ok) {
      return NameModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(decodedResponse);
    }
  }
}
