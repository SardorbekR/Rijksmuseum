part of 'collections_list_bloc.dart';

@freezed
class CollectionsListState with _$CollectionsListState {
  const factory CollectionsListState.loading() = LoadingState;

  const factory CollectionsListState.loaded(ArtObjectsCollection collectionsMuseum) = LoadedState;

  const factory CollectionsListState.error(String errorMsg) = ErrorState;
}
