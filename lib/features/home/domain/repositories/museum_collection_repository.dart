import '../../data/models/art_objects_collection_data.dart';

abstract class MuseumCollectionRepository {
  Future<ArtObjectsCollection> fetchCollections(int page);
}
