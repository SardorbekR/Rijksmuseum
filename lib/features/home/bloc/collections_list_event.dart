part of 'collections_list_bloc.dart';

@freezed
class CollectionsListEvent with _$CollectionsListEvent {
  const factory CollectionsListEvent.loadInitialArtObjects() = LoadInitialArtObjects;
  const factory CollectionsListEvent.loadMoreArtObjects() = LoadMoreArtObjects;
}
