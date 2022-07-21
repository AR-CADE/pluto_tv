import 'package:pluto_tv/model/clip.dart';
import 'package:pluto_tv/model/distribution.dart';
import 'package:pluto_tv/model/path.dart';
import 'package:pluto_tv/model/series.dart';
import 'package:pluto_tv/model/simple_object.dart';
import 'package:pluto_tv/model/slug.dart';

class Episode implements SimpleObject, Slug {
  final int number;
  final int season;
  final String description;
  final int duration;
  final int originalContentDuration;
  final String genre;
  final String subGenre;
  final Distribution distributeAs;
  final Clip clip;
  final String rating;
  final Path poster;
  final Path thumbnail;
  final bool liveBroadcast;
  final Path featuredImage;
  final Series series;

  @override
  String id;

  @override
  String name;

  @override
  String slug;

  Episode(
      {required this.id,
      required this.name,
      required this.slug,
      required this.number,
      required this.season,
      required this.description,
      required this.duration,
      required this.originalContentDuration,
      required this.genre,
      required this.subGenre,
      required this.distributeAs,
      required this.clip,
      required this.rating,
      required this.poster,
      required this.thumbnail,
      required this.liveBroadcast,
      required this.featuredImage,
      required this.series});

  factory Episode.fromJSON(Map<String, dynamic> json) {
    return Episode(
        id: json['_id'] as String,
        name: json['name'] as String,
        slug: json['slug'] as String,
        number: json['number'] as int,
        season: json['season'] as int,
        description: json['description'] as String,
        duration: json['duration'] as int,
        originalContentDuration: json['originalContentDuration'] as int,
        genre: json['genre'] as String,
        subGenre: json['subGenre'] as String,
        distributeAs: Distribution.fromJSON(json['distributeAs']),
        clip: Clip.fromJSON(json['clip']),
        rating: json['rating'] as String,
        poster: Path.fromJSON(json['poster']),
        thumbnail: Path.fromJSON(json['thumbnail']),
        liveBroadcast: json['liveBroadcast'] as bool,
        featuredImage: Path.fromJSON(json['featuredImage']),
        series: Series.fromJSON(json['series']));
  }
}
