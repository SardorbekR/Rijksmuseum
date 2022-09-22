import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rijksmuseum/core/platform/network_state.dart';
import 'package:rijksmuseum/features/collection_details/bloc/art_details_bloc.dart';
import 'package:rijksmuseum/features/collection_details/data/data_sources/art_details_remotedatasource.dart';
import 'package:rijksmuseum/features/collection_details/data/models/art_object_details_model.dart';
import 'package:rijksmuseum/features/collection_details/data/repositories/rijkmuseum_art_object_details_repo.dart';
import 'package:rijksmuseum/features/collection_details/domain/use_cases/get_art_object_details.dart';
import 'package:rijksmuseum/features/collection_details/presentation/pages/art_details_page.dart';
import 'package:rijksmuseum/features/home/bloc/collections_list_bloc.dart';
import 'package:rijksmuseum/features/home/data/data_source/collections_remote_datasource.dart';
import 'package:rijksmuseum/features/home/data/models/art_objects_collection_data.dart';
import 'package:rijksmuseum/features/home/data/repositories/rijksmusuem_collections_repository.dart';
import 'package:rijksmuseum/features/home/domain/use_cases/get_collections.dart';
import 'package:rijksmuseum/features/home/presentation/pages/home_page.dart';
import 'package:rijksmuseum/features/shared/components/error_page.dart';

import 'test_data/art_details_test_object.dart';
import 'test_data/collection_test_object.dart';

class MockNetworkState extends Mock implements NetworkState {}

class MockHttpClient extends Mock implements Client {}

class MockArtDetailsRemoteDataSource extends Mock implements ArtDetailsRemoteDatasource {}

class MockCollectionsRemoteDataSource extends Mock implements CollectionsRemoteDatasource {}

void main() {
  late MockArtDetailsRemoteDataSource mockArtDetailsRemoteDataSource;
  late MockCollectionsRemoteDataSource mockCollectionsRemoteDataSource;
  late MockNetworkState mockNetworkState;

  final artObjectModel = ArtObjectDetailsModel.fromJson(json.decode(artDetailsJson));
  final collectionModelWith5ArtObjects = ArtObjectsCollection.fromJson(json.decode(collectionJson));

  Widget widgetUnderTest() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CollectionsListBloc(
            GetCollections(
              RijksmuseumCollectionsRepository(
                remoteDataSource: mockCollectionsRemoteDataSource,
                networkState: mockNetworkState,
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => ArtDetailsBloc(
            GetArtObjectDetails(
              RijksmuseumArtObjectDetailsRepository(
                remoteDataSource: mockArtDetailsRemoteDataSource,
                networkState: mockNetworkState,
              ),
            ),
          ),
        ),
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }

  setUpAll(() => TestWidgetsFlutterBinding.ensureInitialized());

  setUp(() {
    mockNetworkState = MockNetworkState();

    mockArtDetailsRemoteDataSource = MockArtDetailsRemoteDataSource();
    mockCollectionsRemoteDataSource = MockCollectionsRemoteDataSource();
  });

  testWidgets(""" 
  Integration test when device connected to the internet
  """, (widgetTester) async {
    when(mockNetworkState.isInternetConnected).thenAnswer((_) async => true);

    when(() => mockArtDetailsRemoteDataSource.getData(any()))
        .thenAnswer((_) async => artObjectModel);
    when(() => mockCollectionsRemoteDataSource.getData(any()))
        .thenAnswer((_) async => collectionModelWith5ArtObjects);

    await widgetTester.pumpWidget(widgetUnderTest());

    await widgetTester.pumpAndSettle();
    await widgetTester.tap(find.text(collectionModelWith5ArtObjects.artObjects[0].longTitle));
    await widgetTester.pumpAndSettle();

    expect(find.byType(HomePage), findsNothing);
    expect(find.byType(ArtDetailsPage), findsOneWidget);
    expect(find.text(artObjectModel.artObject.plaqueDescriptionEnglish), findsOneWidget);

    await widgetTester.pageBack();
    await widgetTester.pumpAndSettle();

    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(ArtDetailsPage), findsNothing);
  });

  testWidgets(""" 
  Error page shown when device is NOT connected to the internet
  """, (widgetTester) async {
    await widgetTester.pumpAndSettle();

    when(mockNetworkState.isInternetConnected).thenAnswer((_) async => false);

    await widgetTester.pumpWidget(widgetUnderTest());

    await widgetTester.pumpAndSettle();

    expect(find.byType(ErrorPage), findsOneWidget);
  });
}
