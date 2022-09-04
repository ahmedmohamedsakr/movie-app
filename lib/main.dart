import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/bloc_observer.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/movies/presentation/screens/movies_screen.dart';

void main() {
  ServicesLocator().init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home:  const MoviesScreen(),
    );
  }
}
