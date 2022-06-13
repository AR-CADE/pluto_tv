import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

String convertDurationToString(Duration duration) {
  var minutes = duration.inMinutes.toString();
  minutes = minutes.length == 1 ? '0$minutes' : minutes;

  var seconds = "${duration.inSeconds % 60}";
  seconds = seconds.length == 1 ? '0$seconds' : seconds;

  return "$minutes:$seconds";
}

class BottomBar extends StatefulWidget {
  final VideoPlayerController controller;
  const BottomBar({Key? key, required this.controller}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late Timer timer;

  Duration? duration;
  Duration? seek;

  @override
  void initState() {
    duration = widget.controller.value.duration;
    seek = widget.controller.value.position;

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (widget.controller.value.isPlaying) {
        setState(() {
          duration = widget.controller.value.duration;
          seek = widget.controller.value.position;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var ctrl = widget.controller;
    var dur = duration;
    var sk = seek;
    return Padding(
        padding: const EdgeInsets.fromLTRB(50, 0, 50, 30),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Stack(
                children: [
                  Column(
                    children: [
                      if (ctrl.value.duration > const Duration())
                        VideoProgressIndicator(
                          ctrl,
                          allowScrubbing: true,
                          colors: const VideoProgressColors(
                              playedColor: Color.fromARGB(250, 0, 255, 112)),
                          padding: const EdgeInsets.only(left: 5.0, right: 5),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            sk != null
                                ? Text(
                                    convertDurationToString(sk),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )
                                : Container(),
                            dur != null
                                ? Text(
                                    convertDurationToString(dur),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
