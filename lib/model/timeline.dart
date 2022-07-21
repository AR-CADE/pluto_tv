import 'package:pluto_tv/model/episode.dart';
import 'package:pluto_tv/model/simple_object.dart';

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
