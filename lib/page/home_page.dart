// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:new_project/main.dart';
import 'package:new_project/widget/add_todo_dialog_widget.dart';
import 'package:new_project/widget/todo_list_widget.dart';

import '../widget/completed_list_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{
  int selectedIndex =0;
  @override
  Widget build(BuildContext context) {

    final tabs = [

      TodoListWidget(),
      CompletedListWidget(),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title)
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.white.withOpacity(0.7),
            selectedItemColor: Colors.white,
            currentIndex: selectedIndex,
            onTap: (index) => setState(() {
              selectedIndex = index;
            }),
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.fact_check_outlined),
                label: 'Todos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.done, size: 28,),
                label: 'Completed',
              ),
            ],
          ),
          body: tabs[selectedIndex],
          floatingActionButton: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
              ),
              backgroundColor: Colors.black,
            child: Icon(Icons.add),
            onPressed: ()=> showDialog(
              context: context, 
              builder: (context) => AddTodoDialogWidget(),
              barrierDismissible: false,
              ),
            ),

    );

  }

}