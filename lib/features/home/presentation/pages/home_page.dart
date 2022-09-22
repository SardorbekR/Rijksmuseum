import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rijksmuseum/features/home/bloc/collections_list_bloc.dart';
import 'package:rijksmuseum/features/home/data/models/art_objects_collection_data.dart';
import 'package:rijksmuseum/features/home/presentation/widgets/collections_list_view.dart';
import 'package:rijksmuseum/features/shared/components/loading_indicator.dart';

import '../../../shared/components/error_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CollectionsListBloc collectionListBloc;
  final scrollController = ScrollController();
  bool isLoading = true;
  List<ArtObject> artObjects = [];

  @override
  void initState() {
    super.initState();
    collectionListBloc = BlocProvider.of<CollectionsListBloc>(context)
      ..add(const CollectionsListEvent.loadInitialArtObjects());
    scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    scrollController.removeListener(() {});
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CollectionsListBloc, CollectionsListState>(
        bloc: collectionListBloc,
        listener: (context, state) {
          if (state is ErrorState) {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg)));
          }
        },
        builder: (context, state) {
          if (state is ErrorState) {
            isLoading = false;

            if (artObjects.isEmpty) {
              return ErrorPage(
                errorMessage: state.errorMsg,
                onTap: () => collectionListBloc.add(
                  const CollectionsListEvent.loadMoreArtObjects(),
                ),
              );
            }
          } else if (state is LoadingState) {
            if (artObjects.isEmpty) return const LoadingIndicator();

            isLoading = true;
          } else if (state is LoadedState) {
            isLoading = false;

            if (artObjects.isEmpty) {
              artObjects = state.collectionsMuseum.artObjects;
            } else {
              artObjects.addAll(state.collectionsMuseum.artObjects);
            }
          }

          return CollectionsListView(
            artObjects,
            scrollController: scrollController,
            isLoading: isLoading,
          );
        },
      ),
    );
  }

  void onScroll() {
    final nextPageTrigger = 0.9 * scrollController.position.maxScrollExtent;

    if (scrollController.position.pixels > nextPageTrigger) {
      if (!isLoading && scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        collectionListBloc.add(const CollectionsListEvent.loadMoreArtObjects());
      }
    }
  }
}
