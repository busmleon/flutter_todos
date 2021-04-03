import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../states/home/home.page.bloc.dart';
import 'widgets/my.circular.progress.indicator.widget.dart';
import 'widgets/my.elevated.button.dart';
import 'widgets/todo.list.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            BlocBuilder<HomePageBloc, HomePageState>(
              builder: (context, state) {
                if (state is HomePageGetTodosLoading) {
                  return MyCircularProgressIndicatorWidget(
                      text: 'Getting Todos...');
                }
                if (state is HomePageGetTodosLoaded) {
                  return TodoListWidget(todos: state.todos);
                }
                if (state is HomePageGetTodosError) {
                  return Text('Error loading todos');
                  //TODO: snackbar
                }
                return Container();
              },
            ),
            MyElevatedButton(
              onPressed: () => getTodos(context),
              text: 'Get Todos',
            ),
          ],
        ),
      ),
    );
  }

  getTodos(BuildContext context) =>
      BlocProvider.of<HomePageBloc>(context).add(const HomePageGetTodosEvent());
}
