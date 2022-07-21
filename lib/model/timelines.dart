import 'package:pluto_tv/model/timelines_data.dart';
import 'package:pluto_tv/model/timelines_meta.dart';

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
