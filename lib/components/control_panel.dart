import 'package:flutter/material.dart';
import 'package:petit_player/petit_player.dart';
import 'package:video_player/video_player.dart';

class ControlPanel extends StatefulWidget {
  final VideoPlayerController controller;
  final VideoStyle videoStyle;

  final Function? onTogglePlay;
  const ControlPanel(
      {Key? key,
      required this.controller,
      this.videoStyle = const VideoStyle(),
      this.onTogglePlay})
      : super(key: key);

  @override
  State<ControlPanel> createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  @override
  Widget build(BuildContext context) {
    var ctrl = widget.controller;
    var fn = widget.onTogglePlay;
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 205,
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                      onTap: () async {
                        await rewind(ctrl);
                      },
                      child: widget.videoStyle.backward),
                  InkWell(
                    onTap: () async {
                      //createHideControlBarTimer();

                      if (ctrl.value.isInitialized) {
                        if (ctrl.value.isPlaying) {
                          await ctrl.pause().then((value) => setState(() {}));
                        } else {
                          await ctrl.play().then((value) => setState(() {}));
                        }

                        if (fn != null) {
                          fn();
                        }
                      }
                    },
                    child: Icon(
                      ctrl.value.isPlaying
                          ? Icons.pause_sharp
                          : Icons.play_arrow_sharp,
                      color: Colors.white,
                      size: 200,
                    ),
                  ),
                  InkWell(
                      onTap: () async {
                        await fastForward(controller: ctrl);
                      },
                      child: widget.videoStyle.forward),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
