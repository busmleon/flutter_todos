import 'package:flutter/material.dart';

class MyCircularProgressIndicatorWidget extends StatelessWidget {
  final String text;
  const MyCircularProgressIndicatorWidget({
    this.text,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
