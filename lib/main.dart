import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:project/Login/Login_page.dart';
import 'Bottom_Bar.dart';
import 'Database/Hive_Database.dart';
import 'Database/Shared_Preferences.dart';
import 'Database/getX.dart';
import 'Database/getX_multi.dart';
import 'Database/http_get.dart';
import 'Screen/Home_Page.dart';
import 'Login/User_Detaile.dart';
import 'flash.dart';
import 'Database/main_sq_lite.dart';


  
void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    await Hive.openBox('Friends');
    runApp(GetMaterialApp(
        translations: MaltiLanguage(),
        locale: Locale('en','US'),
      debugShowCheckedModeBanner: false,
      title: 'SHOP ME',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.red.shade200,
          ),
        ),
        primarySwatch: Colors.blue,
      ),
        home:HTTPGET(),
      ));
    // runApp(
    //   MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'SHOP ME',
    //     theme: ThemeData(
    //       appBarTheme: AppBarTheme(
    //         iconTheme: IconThemeData(
    //           color: Colors.red.shade200,
    //         ),
    //       ),
    //       primarySwatch: Colors.blue,
    //     ),
    //     home: SHEREP(),
    // ),
  // );
}
