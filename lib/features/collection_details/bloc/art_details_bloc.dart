import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rijksmuseum/core/shared/custom_exception.dart';
import 'package:rijksmuseum/features/collection_details/data/models/art_object_details_model.dart';
import 'package:rijksmuseum/features/collection_details/domain/use_cases/get_art_object_details.dart';

part 'art_details_event.dart';

part 'art_details_bloc.freezed.dart';

part 'art_details_state.dart';

class ArtDetailsBloc extends Bloc<ArtDetailsEvent, ArtDetailsState> {
  final GetArtObjectDetails _getArtObjectDetails;

  ArtDetailsBloc(this._getArtObjectDetails) : super(const ArtDetailsState.loading()) {
    on<ArtDetailsEvent>((event, emit) async {
      emit(const ArtDetailsState.loading());
      try {
        final collectionsMuseum = await _getArtObjectDetails(event.objectId);
        emit(ArtDetailsState.loaded(collectionsMuseum));
      } on NetworkException {
        emit(const ArtDetailsState.error('No Internet Connection'));
      } on ServerException {
        emit(const ArtDetailsState.error('Error Occurred On Server'));
      } catch (e) {
        emit(const ArtDetailsState.error('Unexpected Error Occurred'));
      }
    });
  }
}
