import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget
{
  late final int sum;

  ResultPage({super.key, required this.sum});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
        backgroundColor:Colors.grey,
      ),
      body: Center(
        child: Text('The sum is : $sum',
          style: TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
