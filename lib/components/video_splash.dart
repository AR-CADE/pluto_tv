import 'package:flutter/material.dart';
import 'package:pluto_tv/model/channel.dart';

class VideoSplash extends StatelessWidget {
  final Channel channel;

  const VideoSplash({Key? key, required this.channel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(channel.solidLogoPNG.path,
        height: 252, fit: BoxFit.fill, cacheHeight: 252,
        errorBuilder: (BuildContext b, Object o, StackTrace? s) {
      return Text(channel.name,
          style: const TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.clip,
              color: Colors.white));
    });
  }
}
