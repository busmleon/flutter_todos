import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/localizator.dart';
import '../../../states/home/home.page.bloc.dart';
import '../widgets/todo.list.widget.dart';
import 'widgets/my.cupertino.activity.indicator.dart';
import 'widgets/my.cupertino.button.dart';

class CupertinoHomePage extends StatelessWidget {
  const CupertinoHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(Localizator.of(context).translate('home_page_title')),
      ),
      child: SafeArea(
        child: BlocListener<HomePageBloc, HomePageState>(
          listener: (context, state) {
            if (state is HomePageGetTodosError) {
              showCupertinoDialog(
                context: context,
                builder: (_) => CupertinoAlertDialog(
                  title: Text(Localizator.of(context)
                      .translate('home_page_getting_todos_failed')),
                  content: Text(state.error.message),
                  actions: <CupertinoDialogAction>[
                    CupertinoDialogAction(
                      child: Text('Okay'),
                      isDefaultAction: true,
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                BlocBuilder<HomePageBloc, HomePageState>(
                  builder: (context, state) {
                    if (state is HomePageGetTodosLoading) {
                      return MyCupertinoActivityIndicator();
                    }
                    if (state is HomePageGetTodosLoaded) {
                      return TodoListWidget(todos: state.todos);
                    }
                    return Container();
                  },
                ),
                MyCupertinoButton(
                  onPressed: () => getTodos(context),
                  text: Localizator.of(context)
                      .translate('home_page_get_todos_button'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getTodos(BuildContext context) =>
      BlocProvider.of<HomePageBloc>(context).add(const HomePageGetTodosEvent());
}
