import 'package:flutter/material.dart';

class NameListPage extends StatefulWidget {
  @override
  _NameListPageState createState() => _NameListPageState();
}

class _NameListPageState extends State<NameListPage> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _items = [];

  void _addItem() {
    if (_textController.text.isNotEmpty) {
      setState(() {
        _items.add(_textController.text);
        _textController.clear();
      });
    }
  }

  void _showItemDialog(String item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Item'),
          content: Text(item),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showContextMenu(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit Item'),
                onTap: () {
                  Navigator.of(context).pop();
                  _editItem(index);
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Delete Item'),
                onTap: () {
                  Navigator.of(context).pop();
                  _confirmDeleteItem(index);
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Exit'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _editItem(int index) {
    _textController.text = _items[index];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Item'),
          content: TextField(
            controller: _textController,
            decoration: InputDecoration(
              labelText: 'Edit Name',
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                _textController.clear();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  _items[index] = _textController.text;
                  _textController.clear();
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _confirmDeleteItem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure you want to delete this item?'),
          actions: [
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                setState(() {
                  _items.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name List'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Add New Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addItem,
              child: Text('Add'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_items[index]),
                    onTap: () => _showItemDialog(_items[index]),
                    onLongPress: () => _showContextMenu(context, index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
