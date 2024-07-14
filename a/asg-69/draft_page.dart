import 'package:flutter/material.dart';

class DraftPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Draft'),
      ),
      body: ListView(
        children: List.generate(10, (index) {
          return ListTile(
            leading: Icon(Icons.drafts_outlined),
            title: Text('Draft Email $index'),
            subtitle: Text('This is the detail of draft email $index'),
          );
        }),
      ),
    );
  }
}