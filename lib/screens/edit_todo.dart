import 'package:flutter/material.dart';
import 'package:nonametodolist/models/todo.dart';
import 'package:nonametodolist/state/todo_model.dart';
import 'package:provider/provider.dart';

class EditTodoModalForm extends StatefulWidget {
  final Todo todo;

  const EditTodoModalForm({
    Key key,
    this.todo,
  }) : super(key: key);

  @override
  _EditTodoModalFormState createState() => _EditTodoModalFormState();
}

class _EditTodoModalFormState extends State<EditTodoModalForm> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final detailsController = TextEditingController();

  void loadTodo(Todo todo) {}

  void editTodo(updateTodo) {
    Navigator.pop(context);
    updateTodo(widget.todo.id, titleController.text, detailsController.text);
  }

  void deleteTodo(removeTodo) {
    Navigator.pop(context);
    removeTodo(widget.todo.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 168,
      padding: EdgeInsets.fromLTRB(12, 6, 12, 6),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Color(0xffFBDE00),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.black38, spreadRadius: 5)
          ]),
      child: Form(
        key: _formKey,
        child: Consumer<TodoModel>(
          builder: (context, todoModel, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextFormField(
                // keyboardType: TextInputType.multiline,
                // maxLines: null,
                controller: titleController..text = widget.todo.title,
                autofocus: true,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
                decoration: InputDecoration(
                  hintText: 'edit todo title',
                ),
              ),
              TextFormField(
                // keyboardType: TextInputType.multiline,
                // maxLines: null,
                controller: detailsController..text = widget.todo.details,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: 'edit todo details',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      child: Text("delete"),
                      onPressed: () => deleteTodo(todoModel.remove),
                    ),
                    ElevatedButton(
                      child: Text("save"),
                      onPressed: () => editTodo(todoModel.update),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
