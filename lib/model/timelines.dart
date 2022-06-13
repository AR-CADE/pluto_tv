import 'package:pluto_tv/model/path.dart';
import 'package:pluto_tv/model/slug.dart';
import 'package:pluto_tv/model/simple_object.dart';

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

class Clip {
  final DateTime originalReleaseDate;

  Clip({required this.originalReleaseDate});

  factory Clip.fromJSON(Map<String, dynamic> json) {
    return Clip(
        originalReleaseDate:
            DateTime.parse(json['originalReleaseDate']).toUtc());
  }
}

class Distribution {
  final bool avod;

  Distribution({required this.avod});

  factory Distribution.fromJSON(Map<String, dynamic> json) {
    return Distribution(avod: json['AVOD'] as bool);
  }
}

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

class Timeline implements SimpleObject {
  final DateTime start;
  final DateTime stop;
  final String title;
  final Episode episode;

  Timeline(
      {required this.id,
      required this.start,
      required this.stop,
      required this.title,
      required this.episode});

  factory Timeline.fromJSON(Map<String, dynamic> json) {
    return Timeline(
      id: json['_id'] as String,
      start: DateTime.parse(json['start']).toUtc(),
      stop: DateTime.parse(json['stop']).toUtc(),
      title: json['title'] as String,
      episode: Episode.fromJSON(json['episode']),
    );
  }

  @override
  String id;
}

class TimelinesMeta {
  final List<Timeline> timelines;
  final String channelId;
  final String channelSlug;

  TimelinesMeta(
      {required this.timelines,
      required this.channelId,
      required this.channelSlug});

  factory TimelinesMeta.fromJSON(Map<String, dynamic> json) {
    Iterable iterable = json['timelines'];

    List<Timeline> timelines = []..length;

    for (final e in iterable) {
      timelines.add(Timeline.fromJSON(e));
    }

    return TimelinesMeta(
      timelines: timelines,
      channelId: json['channelId'] as String,
      channelSlug: json['channelSlug'] as String,
    );
  }
}

class TimelinesData {
  final String endDateTime;
  final int totalCount;
  final int limit;
  final int dataCount;

  TimelinesData(
      {required this.endDateTime,
      required this.totalCount,
      required this.limit,
      required this.dataCount});

  factory TimelinesData.fromJSON(Map<String, dynamic> json) {
    return TimelinesData(
      endDateTime: json['endDateTime'] as String,
      totalCount: json['totalCount'] as int,
      limit: json['limit'] as int,
      dataCount: json['dataCount'] as int,
    );
  }
}

class Timelines {
  final List<TimelinesData> data;
  final TimelinesMeta meta;

  Timelines({required this.data, required this.meta});

  factory Timelines.fromJSON(Map<String, dynamic> json) {
    Iterable iterable = json['data'];

    List<TimelinesData> data = []..length;

    for (final e in iterable) {
      data.add(TimelinesData.fromJSON(e));
    }

    return Timelines(
      data: data,
      meta: TimelinesMeta.fromJSON(json['meta']),
    );
  }
}
