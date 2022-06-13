import 'package:flutter/material.dart';

class ErrorDisplay extends StatelessWidget {
  const ErrorDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
      width: 60,
      height: 60,
      child: Icon(Icons.error_outline, color: Colors.red),
    ));
  }
}
