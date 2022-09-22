import 'package:rijksmuseum/features/collection_details/data/models/art_object_details_model.dart';

abstract class ArtObjectRepository {
  Future<ArtObjectDetailsModel> getArtObjectDetails(String objectId);
}
