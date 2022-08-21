// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:new_project/model/todo.dart';
import 'package:new_project/provider/todos.dart';
import 'package:new_project/widget/todo_form_widget.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class AddTodoDialogWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AddTodoDialogWidget();
}

class _AddTodoDialogWidget extends State<AddTodoDialogWidget>{
  // ignore: unused_field
  final _formKey = GlobalKey<FormState>();
  String title ='';
  String description = '';
  
  @override
  Widget build(BuildContext context) => AlertDialog(
    content: Form(
      key: _formKey,
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Add Todo',
          style:  TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        const SizedBox(height: 8,),
        TodoFormWidget(

          onChangedTitle: (title) => setState(() => this.title = title),
          onChangedDescription: (description) => 
          setState(() => this.description = description),
          onSavedTodo: addTodo,
        ),
      ],


    ),
    ),
    );
    void addTodo (){

      final isValid = _formKey.currentState!.validate();

      if(!isValid){
        return;
      }else {
        final todo = Todo(
          
          id: DateTime.now().toString(),
          title: title,
          description: description,
          createdTime: DateTime.now(),


        );

        final provider = Provider.of<TodosProvider>(context, listen: false);
        provider.addTodo(todo);

        Navigator.of(context).pop();
      }
    }

}