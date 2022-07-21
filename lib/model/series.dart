import 'package:pluto_tv/model/path.dart';
import 'package:pluto_tv/model/simple_object.dart';
import 'package:pluto_tv/model/slug.dart';

class Series implements SimpleObject, Slug {
  final String type;
  final Path tile;
  final String description;
  final String summary;
  final String displayName;
  final Path featuredImage;

  Series(
      {required this.id,
      required this.name,
      required this.slug,
      required this.type,
      required this.tile,
      required this.description,
      required this.summary,
      required this.displayName,
      required this.featuredImage});

  @override
  String id;

  @override
  String name;

  @override
  String slug;

  factory Series.fromJSON(Map<String, dynamic> json) {
    return Series(
        id: json['_id'] as String,
        name: json['name'] as String,
        slug: json['slug'] as String,
        type: json['type'] as String,
        tile: Path.fromJSON(json['tile']),
        description: json['description'] as String,
        summary: json['summary'] as String,
        displayName: json['displayName'] as String,
        featuredImage: Path.fromJSON(json['featuredImage']));
  }
}
