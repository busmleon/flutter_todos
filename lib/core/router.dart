import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/home/home.page.dart';
import '../states/home/home.page.bloc.dart';
import 'dependency.injector.dart';

class MyRouter {
  const MyRouter();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => injector<HomePageBloc>(),
            child: const HomePage(),
          ),
        );
    }
  }
}
