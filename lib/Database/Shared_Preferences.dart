import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SHEREP extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SHEREPStat();
  }
}

class SHEREPStat extends State<SHEREP> {
  Future<SharedPreferences> preferences = SharedPreferences.getInstance();
  Future<int>? _counter;

  @override
  void initState() {
    _counter = preferences.then((value) => value.getInt('COUNT') ?? 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences'),
      ),
      body: Center(
        child: FutureBuilder(
          future: _counter,
          builder: (context, snap) {
            if (snap.hasData) {
              return Text(
                '${snap.data}',
                style: TextStyle(fontSize: 30),
              );
            } else {
              return Text(
                '${snap.error}',
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        child: Icon(Icons.add),
      ),
    );
  }

  incrementCounter() async {
    SharedPreferences prefs = await preferences;
    int counter = (prefs.getInt('COUNT') ?? 0) + 1;

    setState(
      () {
        _counter = prefs.setInt('COUNT', counter).then((value) => counter);
      },
    );
  }
}
