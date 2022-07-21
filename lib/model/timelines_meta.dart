import 'package:pluto_tv/model/timeline.dart';

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
