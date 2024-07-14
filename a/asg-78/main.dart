import 'package:flutter/material.dart';

import 'name_list_page.dart';

void main()
{
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "NamePage",
      debugShowCheckedModeBanner: false,
      home: NameListPage(),


    );

  }
}