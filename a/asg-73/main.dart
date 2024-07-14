import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'loginpage.dart';

void main()
{
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Splash Screen",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );

  }
}

class SplashScreen extends StatefulWidget
{
  @override
  SplashScreenState createState() => SplashScreenState();
}
class SplashScreenState extends State<SplashScreen>
{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 10),() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage())));

  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(body: Center(child:Lottie.network("https://nikiiashra.000webhostapp.com/Animation/Animation%20-%201717561335043%20(1).json",height: 250,width: 250) ,),);

  }

}