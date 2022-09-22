import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rijksmuseum/core/platform/network_state.dart';
import 'package:rijksmuseum/features/home/bloc/collections_list_bloc.dart';
import 'package:rijksmuseum/features/home/data/data_source/collections_remote_datasource.dart';
import 'package:rijksmuseum/features/home/data/models/art_objects_collection_data.dart';
import 'package:rijksmuseum/features/home/data/repositories/rijksmusuem_collections_repository.dart';
import 'package:rijksmuseum/features/home/domain/use_cases/get_collections.dart';

import '../../../test_resources/test_json_reader.dart';

class MockNetworkState extends Mock implements NetworkState {}

class MockRemoteDataSource extends Mock implements CollectionsRemoteDatasource {}

void main() {
  late CollectionsListBloc bloc;
  late MockNetworkState mockNetworkState;
  late MockRemoteDataSource mockRemoteDataSource;

  final artCollectionModel =
      ArtObjectsCollection.fromJson(json.decode(readFromJson('collections.json')));

  setUp(() {
    mockNetworkState = MockNetworkState();
    mockRemoteDataSource = MockRemoteDataSource();

    bloc = CollectionsListBloc(
      GetCollections(
        RijksmuseumCollectionsRepository(
          networkState: mockNetworkState,
          remoteDataSource: mockRemoteDataSource,
        ),
      ),
    );
  });

  test(
    'should emit ErrorState when there is NO internet',
    () async* {
      when(mockNetworkState.isInternetConnected).thenAnswer((_) async => false);

      final expected = [
        const LoadingState(),
        const ErrorState('No Internet Connection'),
      ];
      bloc.add(const CollectionsListEvent.loadInitialArtObjects());

      expectLater(bloc, emitsInOrder(expected));
    },
  );

  test(
    'should emit [LoadingState, LoadedState] and return collectionsObject when loads data successfully',
    () async* {
      when(mockNetworkState.isInternetConnected).thenAnswer((_) async => true);

      when(() => mockRemoteDataSource.getData(any())).thenAnswer((_) async => artCollectionModel);

      final expected = [
        const LoadingState(),
        LoadedState(artCollectionModel),
      ];

      bloc.add(const CollectionsListEvent.loadInitialArtObjects());

      expectLater(bloc, emitsInOrder(expected));
    },
  );

  test(
    'should emit [LoadingState, LoadedState] on LoadMoreEvent triggered',
    () async* {
      when(mockNetworkState.isInternetConnected).thenAnswer((_) async => true);

      when(() => mockRemoteDataSource.getData(any())).thenAnswer((_) async => artCollectionModel);

      var expected = [
        const LoadingState(),
        LoadedState(artCollectionModel),
      ];

      bloc.add(const CollectionsListEvent.loadInitialArtObjects());

      expectLater(bloc, emitsInOrder(expected));

      bloc.add(const CollectionsListEvent.loadMoreArtObjects());

      expected = [
        const LoadingState(),
        LoadedState(artCollectionModel),
      ];

      expectLater(bloc, emitsInOrder(expected));
    },
  );
}
