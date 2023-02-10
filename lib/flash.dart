import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'Login/Login_page.dart';

class FLASH extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FLASHStat();
  }
}

class FLASHStat extends State<FLASH> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 10),
      () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => LOGIN(),
          ),(route) => false);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var mWidth = mediaQueryData.size.width;
    var mHeight = mediaQueryData.size.height;
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Center(
          child: Container(
            color: Colors.yellow,
            child: Lottie.network(
              'https://assets10.lottiefiles.com/packages/lf20_1OPxxN.json',
            ),
          ),
        ),
      ),
    );
  }
}
