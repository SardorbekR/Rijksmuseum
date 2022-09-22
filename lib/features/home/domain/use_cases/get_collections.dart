import '../../data/models/art_objects_collection_data.dart';
import '../repositories/museum_collection_repository.dart';

class GetCollections {
  final MuseumCollectionRepository _collectionListRepository;

  GetCollections(this._collectionListRepository);

  Future<ArtObjectsCollection> call(int page) async =>
      _collectionListRepository.fetchCollections(page);
}
