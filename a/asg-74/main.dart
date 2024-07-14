import 'package:flutter/material.dart';

import 'home_page.dart';

void main()
{
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Login Page",
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );

  }
}
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Colors.purple,
        titleSpacing: 5.0,
        titleTextStyle: const TextStyle(fontStyle:FontStyle.italic),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("Welcome to Login Page"),
          ),
          SizedBox(height: 15,),
          ElevatedButton(onPressed: ()
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));

          }, child:Text('Go to Home Page'),
          ), ],
      ),
    );
  }
}
