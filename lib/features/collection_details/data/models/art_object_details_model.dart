import 'package:equatable/equatable.dart';

class ArtObjectDetailsModel extends Equatable {
  const ArtObjectDetailsModel({
    required this.artObject,
  });

  final ArtObject artObject;

  factory ArtObjectDetailsModel.fromJson(Map<String, dynamic> json) => ArtObjectDetailsModel(
        artObject: ArtObject.fromJson(json["artObject"]),
      );

  @override
  List<Object?> get props => [artObject];
}

class ArtObject extends Equatable {
  const ArtObject({
    required this.id,
    required this.priref,
    required this.objectNumber,
    required this.language,
    required this.title,
    required this.webImage,
    required this.titles,
    required this.description,
    required this.objectTypes,
    required this.objectCollection,
    required this.plaqueDescriptionDutch,
    required this.plaqueDescriptionEnglish,
    required this.principalMaker,
    required this.materials,
    required this.productionPlaces,
    required this.hasImage,
    required this.historicalPersons,
    required this.documentation,
    required this.principalOrFirstMaker,
    required this.physicalMedium,
    required this.longTitle,
    required this.subTitle,
    required this.scLabelLine,
    required this.label,
    required this.showImage,
    required this.location,
  });

  final String id;
  final String? priref;
  final String? objectNumber;
  final String? language;
  final String? title;
  final WebImage webImage;
  final List<String> titles;
  final String? description;
  final List<String>? objectTypes;
  final List<String>? objectCollection;
  final String plaqueDescriptionDutch;
  final String plaqueDescriptionEnglish;
  final String? principalMaker;
  final List<String>? materials;
  final List<String>? productionPlaces;
  final bool? hasImage;
  final List<String> historicalPersons;
  final List<String> documentation;
  final String? principalOrFirstMaker;
  final String? physicalMedium;
  final String? longTitle;
  final String? subTitle;
  final String? scLabelLine;
  final Label? label;
  final bool? showImage;
  final String? location;

  factory ArtObject.fromJson(Map<String, dynamic> json) => ArtObject(
        id: json["id"],
        priref: json["priref"],
        objectNumber: json["objectNumber"],
        language: json["language"],
        title: json["title"],
        webImage: WebImage.fromJson(json["webImage"]),
        description: json["description"],
        objectTypes: List<String>.from(json["objectTypes"].map((x) => x)),
        objectCollection: List<String>.from(json["objectCollection"].map((x) => x)),
        plaqueDescriptionDutch: json["plaqueDescriptionDutch"] ?? '',
        plaqueDescriptionEnglish: json["plaqueDescriptionEnglish"] ?? '',
        principalMaker: json["principalMaker"],
        materials: List<String>.from(json["materials"].map((x) => x)),
        productionPlaces: List<String>.from(json["productionPlaces"].map((x) => x)),
        hasImage: json["hasImage"],
        historicalPersons: List<String>.from(json["historicalPersons"].map((x) => x)),
        documentation: List<String>.from(json["documentation"].map((x) => x)),
        principalOrFirstMaker: json["principalOrFirstMaker"],
        physicalMedium: json["physicalMedium"],
        longTitle: json["longTitle"],
        subTitle: json["subTitle"],
        scLabelLine: json["scLabelLine"],
        label: Label.fromJson(json["label"]),
        showImage: json["showImage"],
        location: json["location"],
        titles: List<String>.from(json["titles"].map((x) => x)),
      );

  @override
  List<Object?> get props => [
        id,
        priref,
        objectNumber,
        language,
        title,
        webImage,
        titles,
        description,
        objectTypes,
        objectCollection,
        plaqueDescriptionDutch,
        plaqueDescriptionEnglish,
        principalMaker,
        materials,
        productionPlaces,
        hasImage,
        historicalPersons,
        documentation,
        principalOrFirstMaker,
        physicalMedium,
        longTitle,
        subTitle,
        scLabelLine,
        label,
        showImage,
        location,
      ];
}

class Label extends Equatable {
  const Label({
    required this.title,
    required this.makerLine,
    required this.description,
    required this.notes,
    required this.date,
  });

  final String? title;
  final String? makerLine;
  final String? description;
  final String? notes;
  final DateTime? date;

  factory Label.fromJson(Map<String, dynamic> json) => Label(
        title: json["title"],
        makerLine: json["makerLine"],
        description: json["description"],
        notes: json["notes"],
        date: DateTime.parse(json["date"]),
      );

  @override
  List<Object?> get props => [
        title,
        makerLine,
        description,
        notes,
        date,
      ];
}

class WebImage extends Equatable {
  const WebImage({
    required this.width,
    required this.height,
    required this.url,
  });

  final int width;
  final int height;
  final String url;

  factory WebImage.fromJson(Map<String, dynamic> json) => WebImage(
        width: json["width"],
        height: json["height"],
        url: json["url"],
      );

  @override
  List<Object?> get props => [width, height, url];
}
