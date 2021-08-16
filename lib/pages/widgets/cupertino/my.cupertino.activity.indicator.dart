import 'package:flutter/cupertino.dart';

class MyCupertinoActivityIndicator extends StatelessWidget {
  const MyCupertinoActivityIndicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }
}
