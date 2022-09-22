import 'dart:convert';

import 'package:http/http.dart';
import 'package:rijksmuseum/core/shared/constants.dart';
import 'package:rijksmuseum/core/shared/custom_exception.dart';
import 'package:rijksmuseum/core/shared/remote_datasource.dart';
import 'package:rijksmuseum/features/collection_details/data/models/art_object_details_model.dart';

class ArtDetailsRemoteDatasource implements RemoteDataSource<ArtObjectDetailsModel, String> {
  final Client client;

  ArtDetailsRemoteDatasource(this.client);

  @override
  Future<ArtObjectDetailsModel> getData(String objectId) async {
    final response = await client.get(
      Uri.parse('${Constants.kBaseUrl}/en/collection/$objectId?key=${Constants.kApiKey}'),
    );

    if (response.statusCode == 200) {
      return ArtObjectDetailsModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(response.statusCode);
    }
  }
}
