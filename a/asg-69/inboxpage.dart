import 'package:flutter/material.dart';

class InboxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Inbox'),
      ),
      body: ListView(
        children: List.generate(10, (index) {
          return ListTile(
            leading: Icon(Icons.email),
            title: Text('Email $index'),
            subtitle: Text('This is the detail of email $index'),
          );
        }),
      ),
    );
  }
}