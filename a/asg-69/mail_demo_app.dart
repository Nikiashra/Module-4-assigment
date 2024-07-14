import 'package:asg_69/draft_page.dart';
import 'package:asg_69/inboxpage.dart';
import 'package:asg_69/sent_page.dart';
import 'package:asg_69/setting_page.dart';
import 'package:flutter/material.dart';

import 'compose_page.dart';

class MailDemoApp extends StatefulWidget {
  const MailDemoApp({super.key});

  @override
  State<MailDemoApp> createState() => _MailDemoAppState();
}

class _MailDemoAppState extends State<MailDemoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Text("Demo Mail App",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            actions: const <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 13.0),
                child: Icon(
                  Icons.search,
                  size: 25.0,
                ),
              ),
            ],
          ),
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                      ),
                      child: Text('Navigation Menu',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.inbox_outlined),
                      title: Text('Inbox'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => InboxPage()),
                        );
                      },
                    ),
                    const Divider(
                      color: Colors.black,
                      height: 2,
                      thickness: 2,
                    ),
                    ListTile(
                      leading: Icon(Icons.send),
                      title: Text('Sent'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SentPage()),
                        );
                      },
                    ),
                     const Divider(
                      color: Colors.black,
                      height: 2,
                      thickness: 2,
                    ),
                    ListTile(
                      leading: Icon(Icons.drafts),
                      title: Text('Drafts'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DraftPage()),
                        );
                      },
                    ),
                    const Divider(
                      color: Colors.black,
                      height: 2,
                      thickness: 2,
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Settings'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SettingsPage()),
                        );
                      },
                    ),
                    const Divider(
                      color: Colors.black,
                      height: 2,
                      thickness: 2,
                    ),
                  ],

                ),

              ),

              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ComposePage()),
                  );
                  },
                child: const Icon(Icons.edit),
                backgroundColor: Colors.red,
              ),


    );

  }
}
