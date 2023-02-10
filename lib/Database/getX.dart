import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GETX extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GETXState();
  }
}

class GETXState extends State<GETX> {
  var ls = [
    {
      'name': 'English',
      'locale': Locale(
        'en',
        'US',
      ),
    },
    {
      'name': 'ગુજરાતી',
      'locale': Locale(
        'guj',
        'IN',
      ),
    },
    {
      'name': 'हिन्दी',
      'locale': Locale(
        'hi',
        'IN',
      ),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get-X"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              style: TextStyle(fontSize: 30),
              'name'.tr,
            ),
            Text(
              style: TextStyle(fontSize: 30),
              'surname'.tr,
            ),
            Text(
              style: TextStyle(fontSize: 30),
              'age'.tr,
            ),
            ElevatedButton(
              onPressed: () {
                buildDialog(context);
              },
              child: Text('Change Language'),
            ),
          ],
        ),
      ),
    );
  }

  buildDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select Language'),
        content: Container(
          width: double.maxFinite,
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => GestureDetector(
                    child: Text(ls[index]['name'].toString()),
                    onTap: () {
                      updateLanguage(ls[index]['locale']);
                    },
                  ),
              separatorBuilder: (context, index) => Divider(
                    thickness: 3,
                  ),
              itemCount: ls.length),
        ),
      ),
    );
  }

  updateLanguage(l) {
    Get.back();
    Get.updateLocale(l);
     }
}
