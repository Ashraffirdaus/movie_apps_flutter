import 'package:flutter/material.dart';
import 'package:movie_apps/screens/home_page.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[200],
        appBarTheme:  const AppBarTheme(
          color: Colors.blue,
          centerTitle: true,
          elevation: 0,
        )
      ),
      
      home: const HomePage(),
    );
  }
}