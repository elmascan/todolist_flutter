




// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:new_project/model/todo.dart';
import 'package:new_project/provider/todos.dart';
import 'package:new_project/widget/todo_widget.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class TodoListWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      final provider = Provider.of<TodosProvider>(context);
      final todos = provider.todos;



    return todos.isEmpty 
        ? Center (
          child: Text(
            'No todos.',
            style: TextStyle(fontSize: 20),
          ),
          )
        : ListView.separated(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
        separatorBuilder:(context, index) => Container(height: 8),
      itemCount: todos.length,
      itemBuilder: (context, index){
        final todo = todos[index];
        return TodoWidget(todo: todo);
      }, 
       
    );

  }


}