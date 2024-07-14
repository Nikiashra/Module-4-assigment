import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppLifeCyclePage extends StatefulWidget {
  const AppLifeCyclePage({super.key});

  @override
  State<AppLifeCyclePage> createState() => _AppLifeCyclePageState();
}

class _AppLifeCyclePageState extends State<AppLifeCyclePage> with WidgetsBindingObserver
{
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed)
    {
        showToast('Resumed');
        print('Resumed');

    } else if (state == AppLifecycleState.inactive)
    {
      showToast('Inactive');
      print('Inactive');

    } else if (state == AppLifecycleState.detached)
    {
      showToast('Detached');

    } else if (state == AppLifecycleState.paused) {

      showToast('Paused');
    }
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    showToast("Dispose State");
    super.dispose();
  }
  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App LifeCycle demo'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text('App LifeCycle'),
      ),
    );
  }

}
