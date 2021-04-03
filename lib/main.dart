import 'package:flutter/material.dart';

import 'core/dependency.injector.dart' as injector;
import 'core/router.dart';

void main() {
  injector.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todos-List',
      onGenerateRoute: MyRouter.generateRoute,
      initialRoute: '/',
    );
  }
}
