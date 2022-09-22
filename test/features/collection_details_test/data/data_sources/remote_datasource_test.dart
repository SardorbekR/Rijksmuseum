import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rijksmuseum/core/shared/constants.dart';
import 'package:rijksmuseum/core/shared/custom_exception.dart';
import 'package:rijksmuseum/features/collection_details/data/data_sources/art_details_remotedatasource.dart';
import 'package:rijksmuseum/features/collection_details/data/models/art_object_details_model.dart';

import '../../../../test_resources/test_json_reader.dart';

class MockHttpClient extends Mock implements Client {}

void main() {
  late ArtDetailsRemoteDatasource detailsRemoteDatasource;
  late MockHttpClient mockHttpClient;
  const objectId = 'en-SK-A-4100';

  setUp(() {
    mockHttpClient = MockHttpClient();
    detailsRemoteDatasource = ArtDetailsRemoteDatasource(mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(() => mockHttpClient.get(
          Uri.parse('${Constants.kBaseUrl}/en/collection/$objectId?key=0fiuZFh4'),
        )).thenAnswer((_) async => Response(readFromJson('art_object_details.json'), 200, headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        }));
  }

  void setUpMockHttpClientFailure400() {
    when(() => mockHttpClient.get(
          Uri.parse('${Constants.kBaseUrl}/en/collection/$objectId?key=0fiuZFh4'),
        )).thenAnswer((_) async => Response('Unexpected Error', 400));
  }

  group('httpClient success and failure test cases', () {
    final artObjectModel =
        ArtObjectDetailsModel.fromJson(json.decode(readFromJson('art_object_details.json')));

    test(
      'valid model object should be return after receiving Json, when response successful',
      () async {
        setUpMockHttpClientSuccess200();
        final result = await detailsRemoteDatasource.getData(objectId);

        expect(result, equals(artObjectModel));
      },
    );

    test(
      'should throw a ServerException when the response code is not 200',
      () async {
        setUpMockHttpClientFailure400();

        final call = detailsRemoteDatasource.getData(objectId);

        expect(() => call, throwsA(isInstanceOf<ServerException>()));
      },
    );
  });
}
