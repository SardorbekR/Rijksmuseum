import 'package:equatable/equatable.dart';

class ArtObjectsCollection extends Equatable {
  const ArtObjectsCollection({
    required this.artObjects,
  });

  final List<ArtObject> artObjects;

  factory ArtObjectsCollection.fromJson(Map<String, dynamic> json) => ArtObjectsCollection(
        artObjects: List<ArtObject>.from(json["artObjects"].map((x) => ArtObject.fromJson(x))),
      );

  @override
  List<Object?> get props => [artObjects];
}

class ArtObject extends Equatable {
  const ArtObject({
    required this.links,
    required this.id,
    required this.objectNumber,
    required this.title,
    required this.hasImage,
    required this.principalOrFirstMaker,
    required this.longTitle,
    required this.showImage,
    required this.webImage,
    required this.headerImage,
    required this.productionPlaces,
  });

  final Links links;
  final String id;
  final String objectNumber;
  final String title;
  final bool hasImage;
  final String principalOrFirstMaker;
  final String longTitle;
  final bool showImage;
  final CollectionImage webImage;
  final CollectionImage headerImage;
  final List<String> productionPlaces;

  factory ArtObject.fromJson(Map<String, dynamic> json) => ArtObject(
        links: Links.fromJson(json["links"]),
        id: json["id"],
        objectNumber: json["objectNumber"],
        title: json["title"],
        hasImage: json["hasImage"],
        principalOrFirstMaker: json["principalOrFirstMaker"],
        longTitle: json["longTitle"],
        showImage: json["showImage"],
        webImage: CollectionImage.fromJson(json["webImage"]),
        headerImage: CollectionImage.fromJson(json["headerImage"]),
        productionPlaces: List<String>.from(json["productionPlaces"].map((x) => x)),
      );

  @override
  List<Object?> get props => [
        links,
        id,
        objectNumber,
        title,
        hasImage,
        principalOrFirstMaker,
        longTitle,
        showImage,
        webImage,
        headerImage,
        productionPlaces,
      ];
}

class CollectionImage extends Equatable {
  const CollectionImage({
    required this.guid,
    required this.url,
  });

  final String guid;
  final String url;

  factory CollectionImage.fromJson(Map<String, dynamic> json) => CollectionImage(
        guid: json["guid"],
        url: json["url"],
      );

  @override
  List<Object?> get props => [
        guid,
        url,
      ];
}

class Links extends Equatable {
  const Links({
    required this.self,
    required this.web,
  });

  final String self;
  final String web;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"],
        web: json["web"],
      );

  @override
  List<Object?> get props => [self, web];
}
