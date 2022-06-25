import 'dart:async';
import 'package:flutter/material.dart';
import 'package:petit_player/petit_player.dart';
import 'package:pluto_tv/components/bottom_bar.dart';
import 'package:pluto_tv/components/channels.dart';
import 'package:pluto_tv/components/control_panel.dart';
import 'package:pluto_tv/components/error_display.dart';
import 'package:pluto_tv/components/loader.dart';
import 'package:pluto_tv/components/top_bar.dart';
import 'package:pluto_tv/components/video_splash.dart';
import 'package:pluto_tv/model/channel.dart';
import 'package:pluto_tv/model/profile.dart';
import 'package:video_player/video_player.dart';

final Profile profile = Profile();

class VideoPage extends StatefulWidget {
  final Channel channel;

  const VideoPage({
    Key? key,
    required this.channel,
  }) : super(key: key);

  @override
  VideoPageState createState() => VideoPageState();
}

class VideoPageState extends State<VideoPage> {
  bool fullscreen = false;
  late Channel? channel;
  bool showDrawer = false;
  VideoPlayerController? controller;
  Timer? overlayTimer;
  bool showOverlay = false;

  @override
  void initState() {
    channel = widget.channel;
    super.initState();
  }

  @override
  Future<void> dispose() async {
    clearOverlayTimer();
    super.dispose();
  }

  void createOverlayTimer() {
    clearOverlayTimer();
    overlayTimer = Timer(const Duration(milliseconds: 5000), () {
      if (showOverlay) {
        setState(() {
          showOverlay = false;
        });
      }
    });
  }

  void clearOverlayTimer() {
    overlayTimer?.cancel();
  }

  OverlayEntry _createTopOverlayEntry() {
    return OverlayEntry(
        builder: (context) => TopBar(
            onShowDrawer: () {
              setState(() {
                showDrawer = !showDrawer;
              });
            },
            close: () => Navigator.of(context).pop()));
  }

  OverlayEntry _createControlOverlayEntry(
      VideoPlayerController videoController) {
    return OverlayEntry(
        builder: (context) => ControlPanel(controller: videoController));
  }

  OverlayEntry _creatBottomOverlayEntry(VideoPlayerController videoController) {
    return OverlayEntry(
        builder: (context) => BottomBar(controller: videoController));
  }

  void toggleControls() {
    clearOverlayTimer();

    if (!showOverlay) {
      setState(() {
        showOverlay = true;
      });

      createOverlayTimer();
    } else {
      setState(() {
        showOverlay = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cn = channel;
    final ctrl = controller;
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Row(children: [
            AnimatedSize(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: SizedBox(
                width: showDrawer ? 600 : 0,
                child: showDrawer
                    ? Channels(onTap: (Channel c) {
                        clearOverlayTimer();
                        setState(() {
                          showOverlay = false;
                          channel = c;
                        });
                      })
                    : null,
              ),
            ),
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      toggleControls();
                    },
                    child: Container(
                      color: Colors.black,
                      child: Stack(
                        children: [
                          Center(
                              child: FutureBuilder<Channel?>(
                                  future: Future(() => cn),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<Channel?> snapshot) {
                                    final data = snapshot.data;
                                    if (data != null) {
                                      if (snapshot.hasData) {
                                        return player(data);
                                      } else if (snapshot.hasError) {
                                        return const ErrorDisplay();
                                      }
                                    }
                                    return const Loader();
                                  })),
                          if (showOverlay)
                            Overlay(initialEntries: [
                              _createTopOverlayEntry(),
                              if (ctrl != null) ...[
                                _createControlOverlayEntry(ctrl),
                                _creatBottomOverlayEntry(ctrl)
                              ]
                            ])
                        ],
                      ),
                    ))),
          ]),
        ));
  }

  Widget player(Channel data) {
    final uri = Uri(
        scheme: 'https',
        host: 'service-stitcher.clusters.pluto.tv',
        path: 'stitch/hls/channel/${data.id}/master.m3u8',
        queryParameters: profile.toMap());

    return PetitPlayer(
      url: uri.toString(),
      videoLoadingStyle: VideoLoadingStyle(
        loading: Center(
          child: VideoSplash(channel: data),
        ),
      ),
      onInitialized: (c) {
        controller = c;
      },
    );
  }
}
