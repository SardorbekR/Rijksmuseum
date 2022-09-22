import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rijksmuseum/core/platform/network_state.dart';
import 'package:rijksmuseum/core/shared/custom_exception.dart';
import 'package:rijksmuseum/features/home/data/data_source/collections_remote_datasource.dart';
import 'package:rijksmuseum/features/home/data/models/art_objects_collection_data.dart';
import 'package:rijksmuseum/features/home/data/repositories/rijksmusuem_collections_repository.dart';

import '../../../../test_resources/test_json_reader.dart';

class MockNetworkState extends Mock implements NetworkState {}

class MockRemoteDataSource extends Mock implements CollectionsRemoteDatasource {}

void main() {
  late RijksmuseumCollectionsRepository collectionsRepository;
  late MockNetworkState mockNetworkState;
  late MockRemoteDataSource mockRemoteDataSource;

  const page = 1;
  final artCollectionModel =
      ArtObjectsCollection.fromJson(json.decode(readFromJson('collections.json')));

  setUpAll(() {
    mockNetworkState = MockNetworkState();
    mockRemoteDataSource = MockRemoteDataSource();
    collectionsRepository = RijksmuseumCollectionsRepository(
      networkState: mockNetworkState,
      remoteDataSource: mockRemoteDataSource,
    );
  });

  group('Test, when device is connected to the internet. i.e Online', () {
    test(
      'checking if getData called once, and if object model is same as expected',
      () async {
        when(() => mockRemoteDataSource.getData(any())).thenAnswer((_) async => artCollectionModel);

        when(mockNetworkState.isInternetConnected).thenAnswer((_) async => true);

        final result = await collectionsRepository.fetchCollections(page);

        verify(() => mockRemoteDataSource.getData(page)).called(1);
        expect(result, equals(artCollectionModel));
      },
    );
  });

  group('Test, when device is NOT connected to the internet. i.e Offline', () {
    test('Should throw NetworkException if no connection', () async {
      when(mockNetworkState.isInternetConnected).thenAnswer((_) async => false);

      final result = collectionsRepository.fetchCollections(page);

      expect(() => result, throwsA(isInstanceOf<NetworkException>()));
    });
  });
}
