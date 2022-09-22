import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rijksmuseum/core/platform/network_state.dart';
import 'package:rijksmuseum/core/shared/custom_exception.dart';
import 'package:rijksmuseum/features/collection_details/data/data_sources/art_details_remotedatasource.dart';
import 'package:rijksmuseum/features/collection_details/data/models/art_object_details_model.dart';
import 'package:rijksmuseum/features/collection_details/data/repositories/rijkmuseum_art_object_details_repo.dart';

import '../../../../test_resources/test_json_reader.dart';

class MockNetworkState extends Mock implements NetworkState {}

class MockRemoteDataSource extends Mock implements ArtDetailsRemoteDatasource {}

void main() {
  late RijksmuseumArtObjectDetailsRepository artObjectRepository;
  late MockNetworkState mockNetworkState;
  late MockRemoteDataSource mockRemoteDataSource;

  const objectId = 'en-SK-A-4100';
  final artObjectModel =
      ArtObjectDetailsModel.fromJson(json.decode(readFromJson('art_object_details.json')));

  setUpAll(() {
    mockNetworkState = MockNetworkState();
    mockRemoteDataSource = MockRemoteDataSource();
    artObjectRepository = RijksmuseumArtObjectDetailsRepository(
      networkState: mockNetworkState,
      remoteDataSource: mockRemoteDataSource,
    );
  });

  group('Test, when device is connected to the internet. i.e Online', () {
    test(
      'checking if getData called once, and if objectModel is same as expected',
      () async {
        when(() => mockRemoteDataSource.getData(any())).thenAnswer((_) async => artObjectModel);

        when(mockNetworkState.isInternetConnected).thenAnswer((_) async => true);

        final result = await artObjectRepository.getArtObjectDetails(objectId);

        verify(() => mockRemoteDataSource.getData(objectId)).called(1);
        expect(result, equals(artObjectModel));
      },
    );
  });

  group('Test, when device is NOT connected to the internet. i.e Offline', () {
    test('Should throw NetworkException if no connection', () async {
      when(mockNetworkState.isInternetConnected).thenAnswer((_) async => false);

      final result = artObjectRepository.getArtObjectDetails(objectId);

      expect(() => result, throwsA(isInstanceOf<NetworkException>()));
    });
  });
}
