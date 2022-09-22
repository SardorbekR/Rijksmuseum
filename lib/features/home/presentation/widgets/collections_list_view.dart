import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rijksmuseum/features/collection_details/presentation/pages/art_details_page.dart';
import 'package:rijksmuseum/features/home/data/models/art_objects_collection_data.dart';
import 'package:rijksmuseum/features/home/presentation/widgets/image_loading_shimmer.dart';
import 'package:rijksmuseum/features/shared/components/loading_indicator.dart';

class CollectionsListView extends StatelessWidget {
  final List<ArtObject> artObjects;
  final ScrollController scrollController;
  final bool isLoading;

  const CollectionsListView(
    this.artObjects, {
    required this.scrollController,
    required this.isLoading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: _calculateLength(),
      itemBuilder: (context, index) {
        if (index >= artObjects.length) {
          return Visibility(
            visible: isLoading,
            child: const LoadingIndicator(),
          );
        } else {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ArtDetailsPage(artObjects[index].objectNumber)));
            },
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: artObjects[index].headerImage.url,
                    placeholder: (context, _) => const ImageFieldLoadingShimmer(),
                    errorWidget: (context, _, __) => const ImageFieldLoadingShimmer(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(artObjects[index].longTitle),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  int _calculateLength() => isLoading ? artObjects.length + 1 : artObjects.length;
}
