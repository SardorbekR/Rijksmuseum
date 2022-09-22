import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rijksmuseum/core/platform/network_state.dart';
import 'package:rijksmuseum/features/collection_details/bloc/art_details_bloc.dart';
import 'package:rijksmuseum/features/collection_details/data/data_sources/art_details_remotedatasource.dart';
import 'package:rijksmuseum/features/collection_details/data/models/art_object_details_model.dart';
import 'package:rijksmuseum/features/collection_details/data/repositories/rijkmuseum_art_object_details_repo.dart';
import 'package:rijksmuseum/features/collection_details/domain/use_cases/get_art_object_details.dart';

import '../../../test_resources/test_json_reader.dart';

class MockNetworkState extends Mock implements NetworkState {}

class MockRemoteDataSource extends Mock implements ArtDetailsRemoteDatasource {}

void main() {
  late ArtDetailsBloc bloc;
  late MockNetworkState mockNetworkState;
  late MockRemoteDataSource mockRemoteDataSource;

  final artDetailsModel =
      ArtObjectDetailsModel.fromJson(json.decode(readFromJson('art_object_details.json')));

  setUp(() {
    mockNetworkState = MockNetworkState();
    mockRemoteDataSource = MockRemoteDataSource();

    bloc = ArtDetailsBloc(
      GetArtObjectDetails(
        RijksmuseumArtObjectDetailsRepository(
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
      bloc.add(const ArtDetailsEvent.getArtDetailsEvent('objectId'));

      expectLater(bloc, emitsInOrder(expected));
    },
  );

  test(
    'should emit [LoadingState, LoadedState] and return ArtDetailsObject when loads data successfully',
    () async* {
      when(mockNetworkState.isInternetConnected).thenAnswer((_) async => true);

      when(() => mockRemoteDataSource.getData(any())).thenAnswer((_) async => artDetailsModel);

      final expected = [
        const LoadingState(),
        LoadedState(artDetailsModel),
      ];

      bloc.add(const ArtDetailsEvent.getArtDetailsEvent('objectId'));

      expectLater(bloc, emitsInOrder(expected));
    },
  );
}
