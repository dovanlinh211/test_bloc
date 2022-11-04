import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:test_bloc/screens/home_page.dart';
import 'package:test_bloc/bloc_observer';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = SimpleBlocObserver() as BlocObserver;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BloC Demo",
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      routes: {
        HomePage.routeName: (context) => HomePage(),
      },
      initialRoute: HomePage.routeName,
    );
  }
}
