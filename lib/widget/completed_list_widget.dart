



// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:new_project/widget/todo_widget.dart';
import 'package:provider/provider.dart';

import '../provider/todos.dart';

// ignore: use_key_in_widget_constructors
class CompletedListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<TodosProvider>(context);
      final todos = provider.todosCompleted;



    return todos.isEmpty 
        ? Center (
          child: Text(
            'No completed tasks.',
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