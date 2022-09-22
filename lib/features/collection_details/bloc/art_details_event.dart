part of 'art_details_bloc.dart';

@freezed
class ArtDetailsEvent with _$ArtDetailsEvent {
  const factory ArtDetailsEvent.getArtDetailsEvent(String objectId) = GetArtDetails;
}
