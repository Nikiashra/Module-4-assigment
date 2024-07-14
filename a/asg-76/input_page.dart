import 'package:asg_76/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController _first = TextEditingController();
  final TextEditingController _second = TextEditingController();

  void _calculateSum() {
    final int num1 = int.tryParse(_first.text) ?? 0;
    final int num2 = int.tryParse(_second.text) ?? 0;
    final int sum = num1 + num2;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(sum: sum),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Number'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: _first,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Enter First Number"),
            ),
            TextField(
              controller: _second,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Enter Second Number"),
            ),
            SizedBox(height: 15),
            ElevatedButton(onPressed: _calculateSum,
            child:Text('Calculate Sum')
            )
          ],
        ),
      ),
    );
  }
}
