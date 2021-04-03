import 'package:flutter/material.dart';

class ErrorRouteWidget extends StatelessWidget {
  const ErrorRouteWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Something went wrong while routing to a different page.'),
        //TODO: route message with locals
      ),
    );
  }
}
