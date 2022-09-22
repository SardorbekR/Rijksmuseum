import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rijksmuseum/core/shared/constants.dart';
import 'package:rijksmuseum/core/shared/custom_exception.dart';
import 'package:rijksmuseum/features/home/data/data_source/collections_remote_datasource.dart';
import 'package:rijksmuseum/features/home/data/models/art_objects_collection_data.dart';

import '../../../../test_resources/test_json_reader.dart';

class MockHttpClient extends Mock implements Client {}

void main() {
  late CollectionsRemoteDatasource collectionsRemoteDatasource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    collectionsRemoteDatasource = CollectionsRemoteDatasource(mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(() => mockHttpClient.get(
          Uri.parse('${Constants.kBaseUrl}/en/collection?key=0fiuZFh4&p=1&ps=12'),
        )).thenAnswer((_) async => Response(readFromJson('collections.json'), 200, headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        }));
  }

  void setUpMockHttpClientFailure400() {
    when(() => mockHttpClient.get(
          Uri.parse('${Constants.kBaseUrl}/en/collection?key=0fiuZFh4&p=1&ps=12'),
        )).thenAnswer((_) async => Response(readFromJson('collections.json'), 400));
  }

  group('httpClient success and failure test cases', () {
    final artCollectionsObjectModel =
        ArtObjectsCollection.fromJson(json.decode(readFromJson('collections.json')));
    const page = 1;

    test(
      'valid model object should be return after receiving Json, when response successful',
      () async {
        setUpMockHttpClientSuccess200();
        final result = await collectionsRemoteDatasource.getData(page);

        expect(result, equals(artCollectionsObjectModel));
      },
    );

    test(
      'should throw a ServerException when the response code is not 200',
      () async {
        setUpMockHttpClientFailure400();

        final call = collectionsRemoteDatasource.getData(page);

        expect(() => call, throwsA(isInstanceOf<ServerException>()));
      },
    );
  });
}
