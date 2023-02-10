
import 'package:flutter/material.dart';
import 'package:project/Database/sq_lite.dart';


class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppStat();
  }
}

class MyAppStat extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database helper'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
               ElevatedButton(
                onPressed: () async {
                  int i = await DatabaseHelper.instance
                      .insertData({DatabaseHelper.s_name: 'ashish'});
                  print('$i Data Inserted');
                },
                child: Text('Insert'),
              ),
            ElevatedButton(
              onPressed: () async {
                List<Map<String, dynamic>> i =
                    await DatabaseHelper.instance.getAllData();
                print('$i');
              },
              child: Text('Get Data'),
            ),
            ElevatedButton(
              onPressed: () async {
                int i = await DatabaseHelper.instance.updateData({
                  DatabaseHelper.s_id: 2,
                  DatabaseHelper.s_name: 'krish',
                });
                print('$i Data Updated...');
              },
              child: Text('Update'),
            ),
            ElevatedButton(
              onPressed: () async {
                int i = await DatabaseHelper.instance.deleteData(3);
                print('$i Data Deleted...');
              },
              child: Text('Deleted'),
            ),
          ],
        ),
      ),
    );
  }
}
