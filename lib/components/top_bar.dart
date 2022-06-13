import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final Function? toggleFullScreen;
  final Function? onShowDrawer;
  final Function? toggleSettings;
  final Function? toggleInfo;
  final Function? toggleVolume;
  final Function? close;
  const TopBar(
      {Key? key,
      this.toggleFullScreen,
      this.onShowDrawer,
      this.toggleSettings,
      this.toggleVolume,
      this.toggleInfo,
      this.close})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var onToggleChannelsFn = onShowDrawer;
    var toggleFullScreenFn = toggleFullScreen;
    var toggleSettingsFn = toggleSettings;
    var toggleVolumeFn = toggleVolume;
    var toggleInfoFn = toggleInfo;
    var closeFn = close;
    return Padding(
        padding: const EdgeInsets.fromLTRB(50, 30, 50, 0),
        child: Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
              height: 60,
              width: double.infinity,
              // color: Colors.yellow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (onToggleChannelsFn != null) ...<Widget>[
                        InkWell(
                          onTap: onToggleChannelsFn as void Function()?,
                          child: const Icon(
                            Icons.rocket_rounded,
                            color: Colors.white,
                            size: 55,
                          ),
                        ),
                        Container(
                          width: 10,
                        )
                      ]
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (toggleInfoFn != null) ...<Widget>[
                        InkWell(
                          onTap: toggleInfoFn as void Function()?,
                          child: const Icon(
                            Icons.info_outline,
                            color: Colors.white,
                            size: 55,
                          ),
                        ),
                        Container(
                          width: 20,
                        ),
                      ],
                      if (toggleSettingsFn != null) ...<Widget>[
                        InkWell(
                          onTap: toggleSettingsFn as void Function()?,
                          child: const Icon(
                            Icons.video_settings_sharp,
                            color: Colors.white,
                            size: 55,
                          ),
                        ),
                        Container(
                          width: 20,
                        ),
                      ],
                      if (toggleVolumeFn != null) ...<Widget>[
                        InkWell(
                          onTap: toggleVolumeFn as void Function()?,
                          child: const Icon(
                            Icons.volume_up_sharp,
                            color: Colors.white,
                            size: 55,
                          ),
                        ),
                        Container(
                          width: 20,
                        ),
                      ],
                      if (toggleFullScreenFn != null) ...<Widget>[
                        InkWell(
                          onTap: toggleFullScreenFn as void Function()?,
                          child: const Icon(
                            Icons.open_in_full_sharp,
                            color: Colors.white,
                            size: 55,
                          ),
                        ),
                        Container(
                          width: 120,
                        ),
                      ],
                      if (closeFn != null)
                        InkWell(
                          onTap: closeFn as void Function()?,
                          child: const Icon(
                            Icons.close_sharp,
                            color: Colors.white,
                            size: 55,
                          ),
                        )
                    ],
                  ),
                ],
              )),
        ));
  }
}
