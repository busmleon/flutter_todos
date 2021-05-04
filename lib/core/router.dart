import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../pages/home/cupertino/cupertino.home.page.dart';

import '../pages/home/material/material.home.page.dart';
import '../states/home/home.page.bloc.dart';
import 'dependency.injector.dart';

class MyRouter {
  const MyRouter();
  static Route<MaterialPageRoute> generateMaterialRoute(
      RouteSettings settings) {
    switch (settings.name) {
      case '/':
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => injector<HomePageBloc>(),
            child: const MaterialHomePage(),
          ),
        );
    }
  }

  static Route<CupertinoPageRoute> generateCupertinoRoute(
      RouteSettings settings) {
    switch (settings.name) {
      case '/':
      default:
        return CupertinoPageRoute(
          settings: settings,
          title: 'Home',
          builder: (_) => BlocProvider(
            create: (_) => injector<HomePageBloc>(),
            child: const CupertinoHomePage(),
          ),
        );
    }
  }
}
