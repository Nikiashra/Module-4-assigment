import 'package:flutter/material.dart';

import 'contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact List',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home:const HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  List<Contact> contacts = List.empty(growable :true);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children:[
            const SizedBox(height: 10),

            TextField(
              controller:nameController,
              decoration: InputDecoration(
                  hintText: 'Contact Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  )
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller:contactController ,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: InputDecoration(
                  hintText: 'Contact Number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  )
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed:()
                {
                  String name = nameController.text.trim();
                  String contact = contactController.text.trim();

                  if(name.isNotEmpty && contact.isNotEmpty)

                  {
                    setState(() {
                      nameController.text = "";
                      contactController.text = "";
                      contacts.add(Contact(name: name, contact: contact));
                    });
                  }
                },
                    child: Text('Save')),
                ElevatedButton(onPressed:() {},
                    child: Text('Update')),
              ],
            ),
            SizedBox(height: 10),

            contacts.isEmpty? const Text("No Contact Yet..",style: TextStyle(fontSize: 17),
            ):
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context,index)=> getRow(index),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget getRow(int index){
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: index%2==0 ? Colors.deepPurple: Colors.purple,
          child: Text(contacts[index].name[0]),
        ),
        title: Column(
          children: [
            Text(contacts[index].name),
            Text(contacts[index].contact)
          ],
        ),
        trailing:SizedBox(width: 70),
          child:
          Row(
          children: const [
            Icon(Icons.edit),
            Icon(Icons.delete),
          ],
        ),
      ),
    );

  }
}

