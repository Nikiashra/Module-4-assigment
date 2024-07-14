import 'package:flutter/material.dart';

class SentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Sent'),
      ),
      body: ListView(
        children: List.generate(10, (index) {
          return ListTile(
            leading: Icon(Icons.send),
            title: Text('Sent Email $index'),
            subtitle: Text('This is the detail of sent email $index'),
          );
        }),
      ),
    );
  }
}