import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:rijksmuseum/core/platform/network_state.dart';
import 'package:rijksmuseum/features/collection_details/bloc/art_details_bloc.dart';
import 'package:rijksmuseum/features/collection_details/data/data_sources/art_details_remotedatasource.dart';
import 'package:rijksmuseum/features/collection_details/data/repositories/rijkmuseum_art_object_details_repo.dart';
import 'package:rijksmuseum/features/collection_details/domain/use_cases/get_art_object_details.dart';
import 'package:rijksmuseum/features/home/bloc/collections_list_bloc.dart';
import 'package:rijksmuseum/features/home/data/data_source/collections_remote_datasource.dart';
import 'package:rijksmuseum/features/home/data/repositories/rijksmusuem_collections_repository.dart';
import 'package:rijksmuseum/features/home/domain/use_cases/get_collections.dart';

class DependencyProvider extends StatelessWidget {
  final Widget child;

  const DependencyProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CollectionsListBloc(
            GetCollections(
              RijksmuseumCollectionsRepository(
                remoteDataSource: CollectionsRemoteDatasource(Client()),
                networkState: NetworkState(),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => ArtDetailsBloc(
            GetArtObjectDetails(
              RijksmuseumArtObjectDetailsRepository(
                remoteDataSource: ArtDetailsRemoteDatasource(Client()),
                networkState: NetworkState(),
              ),
            ),
          ),
        ),
      ],
      child: child,
    );
  }
}
