import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rijksmuseum/features/collection_details/bloc/art_details_bloc.dart';
import 'package:rijksmuseum/features/home/presentation/widgets/image_loading_shimmer.dart';
import 'package:rijksmuseum/features/shared/components/error_page.dart';
import 'package:rijksmuseum/features/shared/components/loading_indicator.dart';

class ArtDetailsPage extends StatefulWidget {
  final String objectId;

  const ArtDetailsPage(this.objectId, {super.key});

  @override
  State<ArtDetailsPage> createState() => _ArtDetailsPageState();
}

class _ArtDetailsPageState extends State<ArtDetailsPage> {
  late ArtDetailsBloc artDetailsBloc;

  @override
  void initState() {
    super.initState();
    artDetailsBloc = BlocProvider.of<ArtDetailsBloc>(context)
      ..add(ArtDetailsEvent.getArtDetailsEvent(widget.objectId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Art Details'),
      ),
      body: BlocBuilder<ArtDetailsBloc, ArtDetailsState>(
        bloc: artDetailsBloc,
        builder: (context, state) {
          if (state is ErrorState) {
            return ErrorPage(
              onTap: () => artDetailsBloc.add(ArtDetailsEvent.getArtDetailsEvent(widget.objectId)),
              errorMessage: state.errorMsg,
            );
          }

          if (state is LoadedState) {
            final artObject = state.artObjectDetails.artObject;

            return Column(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height / 2,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: artObject.webImage.url,
                    placeholder: (context, _) =>
                        ImageFieldLoadingShimmer(height: artObject.webImage.height.toDouble()),
                    errorWidget: (context, _, __) =>
                        ImageFieldLoadingShimmer(height: artObject.webImage.height.toDouble()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(artObject.plaqueDescriptionEnglish),
                )
              ],
            );
          }

          return const LoadingIndicator();
        },
      ),
    );
  }
}
