import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/core/localizator.dart';
import 'package:flutter_todos/features/todos/entities/todo.entity.dart';
import 'package:flutter_todos/features/todos/models/todo.model.dart';
import 'package:flutter_todos/pages/home/material/widgets/my.circular.progress.indicator.widget.dart';
import 'package:flutter_todos/pages/home/material/widgets/my.elevated.button.dart';
import 'package:flutter_todos/states/create/create.page.bloc.dart';

class MaterialCreatePage extends StatefulWidget {
  static const routName = '/createPage';
  const MaterialCreatePage({Key key}) : super(key: key);

  @override
  _MaterialCreatePageState createState() => _MaterialCreatePageState();
}

class _MaterialCreatePageState extends State<MaterialCreatePage> {
  TextEditingController createTodoController = new TextEditingController();
  TodoModel todoModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Localizator.of(context).translate('create_page_title'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            BlocConsumer<CreatePageBloc, CreatePageState>(
              builder: (context, state) {
                if (state is CreatePageTodoLoading) {
                  return MyCircularProgressIndicatorWidget();
                }
                return Container();
              },
              listener: (context, state) {
                print('Hier State ${state}');
                // ScaffoldMessenger.of(context).hideCurrentSnackBar();
                if (state is CreatePageTodoError) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(Localizator.of(context)
                            .translate('create_page_creating_todo_error') +
                        ' (${state.error.message})'),
                  ));
                }
                if (state is CreatePageTodoCreated) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      Localizator.of(context).translate(
                              'create_page_creating_todo_succeeded') +
                          '(${state.props}',
                    ),
                  ));
                }
              },
            ),
            TextField(
              controller: createTodoController,
              decoration: InputDecoration(
                hintText: Localizator.of(context)
                    .translate('create_page_todo_hint_text'),
              ),
            ),
            MyElevatedButton(
              onPressed: () {
                todoModel =
                    new TodoModel(description: createTodoController.value.text);
                createTodo(context, new TodoEntity.fromModel(todoModel));
              },
              text: Localizator.of(context)
                  .translate('create_page_create_todo_button'),
            ),
          ],
        ),
      ),
    );
  }

  createTodo(BuildContext context, TodoEntity todoEntity) =>
      BlocProvider.of<CreatePageBloc>(context)
          .add(CreateTodoPageEvent(todoEntity: todoEntity));
}
