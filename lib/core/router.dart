import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/create-todo/material/material.create.todo.page.dart';
import '../pages/home/cupertino/cupertino.home.page.dart';
import '../pages/home/material/material.home.page.dart';
import '../states/create-todo/create.todo.page.bloc.dart';
import '../states/home/home.page.bloc.dart';
import 'dependency.injector.dart';

class MyRouter {
  const MyRouter();
  static Route<MaterialPageRoute> generateMaterialRoute(
      RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => injector<HomePageBloc>(),
            child: const MaterialHomePage(),
          ),
        );
      case '/createPage':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => injector<CreatePageBloc>(),
            child: const MaterialCreatePage(),
          ),
        );
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
        return CupertinoPageRoute(
          settings: settings,
          title: 'Home',
          builder: (_) => BlocProvider(
            create: (_) => injector<HomePageBloc>(),
            child: const CupertinoHomePage(),
          ),
        );
      case '/createPage':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => injector<CreatePageBloc>(),
            child: const MaterialCreatePage(),
          ),
        );
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
