import 'package:flutter/material.dart';
import 'package:moviesapp/core/services/service_locator.dart';
import 'package:moviesapp/core/utils/app_string.dart';
import 'package:moviesapp/movie/presntion/screens/movies_screen.dart';

void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      home: MainMoviesScreen(),
    );
  }
}
