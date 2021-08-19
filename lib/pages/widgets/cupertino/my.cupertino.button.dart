import 'package:flutter/cupertino.dart';

class MyCupertinoButton extends CupertinoButton {
  MyCupertinoButton({
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
