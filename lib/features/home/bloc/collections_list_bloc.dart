import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rijksmuseum/core/shared/custom_exception.dart';
import 'package:rijksmuseum/features/home/data/models/art_objects_collection_data.dart';

import '../domain/use_cases/get_collections.dart';

part 'collections_list_event.dart';

part 'collections_list_bloc.freezed.dart';

part 'collections_list_state.dart';

class CollectionsListBloc extends Bloc<CollectionsListEvent, CollectionsListState> {
  final GetCollections _getCollections;

  CollectionsListBloc(this._getCollections) : super(const CollectionsListState.loading()) {
    int page = 1;
    on<CollectionsListEvent>((event, emit) async {
      await event.map(
        loadInitialArtObjects: (_) async {
          await _tryLoadCollections(page, emit);
        },
        loadMoreArtObjects: (_) async {
          ++page;
          await _tryLoadCollections(page, emit);
        },
      );
    });
  }

  Future<void> _tryLoadCollections(int page, Emitter<CollectionsListState> emit) async {
    emit(const CollectionsListState.loading());
    try {
      final collectionsMuseum = await _getCollections(page);
      emit(CollectionsListState.loaded(collectionsMuseum));
    } on NetworkException {
      emit(const CollectionsListState.error('No Internet Connection'));
    } on ServerException {
      emit(const CollectionsListState.error('Error Occurred On Server'));
    } catch (e) {
      emit(const CollectionsListState.error('Unexpected Error Occurred'));
    }
  }
}
