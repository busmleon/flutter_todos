import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/home/home.page.dart';
import '../states/home/home.page.bloc.dart';
import 'dependency.injector.dart';
import 'widgets/error.route.widget.dart';

class MyRouter {
  const MyRouter();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => injector<HomePageBloc>(),
            child: const HomePage(),
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => const ErrorRouteWidget());
    }
  }
}
