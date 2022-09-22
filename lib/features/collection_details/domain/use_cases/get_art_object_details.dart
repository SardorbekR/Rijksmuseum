import 'package:rijksmuseum/features/collection_details/data/models/art_object_details_model.dart';
import 'package:rijksmuseum/features/collection_details/data/repositories/rijkmuseum_art_object_details_repo.dart';

class GetArtObjectDetails {
  final RijksmuseumArtObjectDetailsRepository _rijksmuseumArtObjectDetailsRepository;

  GetArtObjectDetails(this._rijksmuseumArtObjectDetailsRepository);

  Future<ArtObjectDetailsModel> call(String objectId) async =>
      _rijksmuseumArtObjectDetailsRepository.getArtObjectDetails(objectId);
}
