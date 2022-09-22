import 'package:rijksmuseum/core/platform/network_state.dart';
import 'package:rijksmuseum/core/shared/custom_exception.dart';
import 'package:rijksmuseum/core/shared/remote_datasource.dart';
import 'package:rijksmuseum/features/collection_details/data/models/art_object_details_model.dart';
import 'package:rijksmuseum/features/collection_details/domain/repositories/art_object_repository.dart';

class RijksmuseumArtObjectDetailsRepository implements ArtObjectRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkState networkState;

  RijksmuseumArtObjectDetailsRepository({
    required this.remoteDataSource,
    required this.networkState,
  });

  @override
  Future<ArtObjectDetailsModel> getArtObjectDetails(String objectId) async {
    if (!await networkState.isInternetConnected()) {
      throw const NetworkException();
    }

    return await remoteDataSource.getData(objectId);
  }
}
