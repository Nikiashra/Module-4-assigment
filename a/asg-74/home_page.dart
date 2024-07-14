import 'package:asg_74/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

          appBar: AppBar(
            title: const Text("Home Page"),
            backgroundColor: Colors.red,
          ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("Welcome to Home Page"),
          ),
          SizedBox(height: 15,),
          ElevatedButton(onPressed: ()
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));

          }, child:Text('Go to Login Page'),
          ), ],
      ),
    );
  }
}
