class ChannelUrl {
  final String type;
  final String url;
  ChannelUrl({required this.type, required this.url});

  factory ChannelUrl.fromJSON(Map<String, dynamic> json) {
    return ChannelUrl(type: json['type'] as String, url: json['url'] as String);
  }
}
