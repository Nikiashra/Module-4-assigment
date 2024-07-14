import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home:MyApp()));
}
class MyApp extends StatefulWidget
{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Exit Alert"),),
      body: Center(

        child: Column(

          children: [

            ElevatedButton
              (
                onPressed: ()
                {

                  showdialog123(context);

                },
                child: Text("Click Me"))


          ],


        ),

      ),

    );
  }

  showdialog123(BuildContext context)
  {

    Widget okbutton = ElevatedButton(onPressed: ()
    {

      print("clicked");

    }, child: Text("OK"));

    AlertDialog alert = AlertDialog(
      title: Text("Do you want to Exit"),
      content: Text("This is an alert message."),
      actions:
      [
        okbutton
      ],
    );

    showDialog(context: context, builder: (BuildContext context)
    {
      return alert;
    });


  }
}