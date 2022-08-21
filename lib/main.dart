import 'package:flutter/material.dart';
import 'package:new_project/page/home_page.dart';
import 'package:new_project/provider/todos.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  // ignore: prefer_const_declarations
  static final String title = 'Todo App';
  
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context)=> TodosProvider(),
  
    child: MaterialApp(

    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(
      primarySwatch: Colors.pink,
      // ignore: prefer_const_constructors
      scaffoldBackgroundColor: Color (0xFFf6f5ee),
    ),
    home: HomePage(),
  )
  );
}