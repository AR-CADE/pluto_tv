import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pluto_tv/pages/home.dart';

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.touch,
        PointerDeviceKind.invertedStylus,
      };
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //await API.boot();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  runApp(MaterialApp(
    scrollBehavior: CustomScrollBehavior(),
    debugShowCheckedModeBanner: false,
    title: 'PlutoTV',
    home: const HomePage(),
  ));
}
