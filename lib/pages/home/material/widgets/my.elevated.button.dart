import 'package:flutter/material.dart';

class MyElevatedButton extends ElevatedButton {
  MyElevatedButton({
    @required String text,
    @required Function onPressed,
    Key key,
  })  : assert(text != null),
        assert(onPressed != null),
        super(
          key: key,
          child: Text(text),
          onPressed: onPressed,
        );
}
