import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/material/my.circular.progress.indicator.widget.dart';
import '../../widgets/material/my.elevated.button.dart';

import '../../../core/localizator.dart';
import '../../../states/home/home.page.bloc.dart';

import '../widgets/todo.list.widget.dart';

class MaterialHomePage extends StatelessWidget {
  const MaterialHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Localizator.of(context).translate('home_page_title')),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, '/createPage'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: BlocListener<HomePageBloc, HomePageState>(
        listener: (context, state) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          if (state is HomePageGetTodosError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(Localizator.of(context)
                      .translate('home_page_getting_todos_failed') +
                  ' (${state.error.message})'),
            ));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              BlocBuilder<HomePageBloc, HomePageState>(
                builder: (context, state) {
                  if (state is HomePageGetTodosLoading) {
                    return MyCircularProgressIndicatorWidget();
                  }
                  if (state is HomePageGetTodosLoaded) {
                    return TodoListWidget(todos: state.todos);
                  }
                  return Container();
                },
              ),
              MyElevatedButton(
                onPressed: () => getTodos(context),
                text: Localizator.of(context)
                    .translate('home_page_get_todos_button'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getTodos(BuildContext context) =>
      BlocProvider.of<HomePageBloc>(context).add(const HomePageGetTodosEvent());
}
