import 'package:rijksmuseum/core/platform/network_state.dart';
import 'package:rijksmuseum/core/shared/custom_exception.dart';
import 'package:rijksmuseum/core/shared/remote_datasource.dart';
import 'package:rijksmuseum/features/home/data/models/art_objects_collection_data.dart';

import '../../domain/repositories/museum_collection_repository.dart';

class RijksmuseumCollectionsRepository implements MuseumCollectionRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkState networkState;

  RijksmuseumCollectionsRepository({
    required this.remoteDataSource,
    required this.networkState,
  });

  @override
  Future<ArtObjectsCollection> fetchCollections(int page) async {
    if (!await networkState.isInternetConnected()) {
      throw const NetworkException();
    }

    return await remoteDataSource.getData(page);
  }
}
