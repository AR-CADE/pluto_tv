import 'package:flutter/material.dart';
import 'package:pluto_tv/model/channel.dart';

class ChannelLogo extends StatelessWidget {
  final Channel channel;
  final FilterQuality filterQuality;
  final double height;
  final double? width;
  final String? placeHolder;
  const ChannelLogo(
      {Key? key,
      required this.channel,
      this.filterQuality = FilterQuality.medium,
      required this.height,
      this.width,
      this.placeHolder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      channel.colorLogoPNG.path,
      height: height,
      width: width,
      fit: BoxFit.fill,
      cacheHeight: height.toInt(), //add this line
      cacheWidth: width?.toInt(),
      errorBuilder: (BuildContext b, Object o, StackTrace? s) {
        return Center(
            child: Text(placeHolder ?? channel.name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.clip,
                    color: Colors.white)));
      },
    );
  }
}
