import 'dart:convert';

import 'package:http/http.dart';
import 'package:rijksmuseum/core/shared/constants.dart';
import 'package:rijksmuseum/core/shared/custom_exception.dart';
import 'package:rijksmuseum/core/shared/remote_datasource.dart';
import 'package:rijksmuseum/features/home/data/models/art_objects_collection_data.dart';

class CollectionsRemoteDatasource implements RemoteDataSource<ArtObjectsCollection, int> {
  final Client client;

  CollectionsRemoteDatasource(this.client);

  @override
  Future<ArtObjectsCollection> getData(int page) async {
    final response = await client.get(
      Uri.parse('${Constants.kBaseUrl}/en/collection?key=0fiuZFh4&p=$page&ps=12'),
    );

    if (response.statusCode == 200) {
      return ArtObjectsCollection.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(response.statusCode);
    }
  }
}
