import 'package:flutter/material.dart';
import 'package:nonametodolist/screens/todo_screen.dart';
import 'package:nonametodolist/state/todo_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoModel(),
      child: NoNameTodoApp(),
    ),
  );
}

class NoNameTodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'No Name Todo App',
      home: TodoScreen(),
      theme: ThemeData(
        // Scaffold Colours from website
        scaffoldBackgroundColor: Color(0xffFBDE00),

        // Text colors from website
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Roboto',
              bodyColor: Color(0xff121212),
              displayColor: Color(0xff121212),
            ),

        //Floating Icon theme
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Color(0xffFBDE00),
          backgroundColor: Color(0xff121212),
        ),

        // Checkbox theme
        checkboxTheme: CheckboxThemeData(
          fillColor:
              MaterialStateProperty.resolveWith((states) => Color(0xff121212)),
          checkColor:
              MaterialStateProperty.resolveWith((states) => Color(0xffFBDE00)),
        ),

        // Bottom sheet theme
        bottomSheetTheme: BottomSheetThemeData(
          modalBackgroundColor: Color(0x00FBDE00),
        ),

        // Button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
                (states) => Color(0xff121212)),
            foregroundColor: MaterialStateProperty.resolveWith(
                (states) => Color(0xffFBDE00)),
          ),
        ),
      ),
    );
  }
}
