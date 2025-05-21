import 'package:flutter/material.dart';
import 'package:wallpaper/UI%20part/homepage.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => _MuAppState();
}

class _MuAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: "Wallpaper",
     home: Homepage(),
     debugShowCheckedModeBanner: false,
   );
  }
}