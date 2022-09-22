part of 'art_details_bloc.dart';

@freezed
class ArtDetailsState with _$ArtDetailsState {
  const factory ArtDetailsState.loading() = LoadingState;

  const factory ArtDetailsState.loaded(ArtObjectDetailsModel artObjectDetails) = LoadedState;

  const factory ArtDetailsState.error(String errorMsg) = ErrorState;
}
