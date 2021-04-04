import 'package:flutter/material.dart';

import '../localizator.dart';

class ErrorRouteWidget extends StatelessWidget {
  const ErrorRouteWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Localizator.of(context).translate('error_route_title')),
      ),
      body: Center(
        child: Text(Localizator.of(context).translate('error_route_text')),
      ),
    );
  }
}
