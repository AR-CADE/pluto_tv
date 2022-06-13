import 'package:flutter/material.dart';
import 'package:pluto_tv/api.dart';
import 'package:pluto_tv/components/channel_logo.dart';
import 'package:pluto_tv/components/error_display.dart';
import 'package:pluto_tv/components/loader.dart';
import 'package:pluto_tv/model/channel.dart';

class Channels extends StatelessWidget {
  final Function? onTap;
  const Channels({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 15, 15, 15),
      child: FutureBuilder<List<Channel>>(
          future: API.getChannelList(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Channel>> snapshot) {
            final data = snapshot.data;
            if (snapshot.hasData && data != null) {
              return Padding(
                  padding: const EdgeInsets.all(20),
                  child: GridView.builder(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemCount: data.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return InkWell(
                            onTap: () {
                              if (onTap != null) {
                                onTap!(data[index]);
                              }
                            },
                            child: Container(
                              // padding: EdgeInsets.all(10.0),
                              //clipBehavior: Clip.antiAlias,
                              alignment: Alignment.center,

                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child:
                                  ChannelLogo(channel: data[index], height: 72),
                            ));
                      }));
            } else if (snapshot.hasError) {
              return const ErrorDisplay();
            }

            return const Loader();
          }),
    );
  }
}
