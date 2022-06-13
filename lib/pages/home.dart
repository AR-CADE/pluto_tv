import 'package:flutter/material.dart';
import 'package:pluto_tv/components/channels.dart';
import 'package:pluto_tv/model/channel.dart';
import 'package:pluto_tv/pages/video.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body:
            SafeArea(child: SizedBox(child: Channels(onTap: (Channel c) async {
          await Navigator.of(context).push(_createRoute(c));
        }))));
  }
}

Route _createRoute(Channel channel) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        VideoPage(channel: channel),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
