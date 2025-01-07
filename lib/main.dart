import 'package:flutter/material.dart';
import 'package:flutter_todo_app/pages/home_page.dart';
import 'package:flutter_todo_app/themes/app_themes.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{

  //init the hive
  await Hive.initFlutter();

  //open a box
  await Hive.openBox('mybox');
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//       //theme: ThemeData(primarySwatch: Colors.yellow),
//     );
//   }
// }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool _isDarkMode=false;

  void toggleTheme(){
    setState(() {
      _isDarkMode=!_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(toggleTheme: toggleTheme, isDarkMode: _isDarkMode,),
      theme: _isDarkMode ? AppThemes.darkTheme : AppThemes.lightTheme,
    );
  }
}

