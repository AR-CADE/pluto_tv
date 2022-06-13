import 'package:pluto_tv/model/channel_url.dart';

class Stitched {
  final List<ChannelUrl> urls;
  final String sessionURL;
  Stitched({required this.sessionURL, required this.urls});

  factory Stitched.fromJSON(Map<String, dynamic> json) {
    Iterable iterable = json['urls'];

    List<ChannelUrl> urls = []..length;

    for (final e in iterable) {
      urls.add(ChannelUrl.fromJSON(e));
    }

    return Stitched(sessionURL: json['sessionURL'] as String, urls: urls);
  }
}
