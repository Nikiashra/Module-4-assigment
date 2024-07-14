import 'package:asg_77/url_launch.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "UrlPage",
      debugShowCheckedModeBanner: false,
      home: UrlScreen(),


    );

  }
}