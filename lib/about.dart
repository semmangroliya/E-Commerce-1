import 'package:flutter/material.dart';

class ABOUT extends StatefulWidget {
  @override
  State<ABOUT> createState() => ABOUTState();
}

class ABOUTState extends State<ABOUT> {
  bool? box = false;
  ThemeData _lightTheme =
      ThemeData(brightness: Brightness.light, primaryColor: Colors.grey);
  ThemeData _dartTheme =

      ThemeData(brightness: Brightness.dark, primaryColor: Colors.green);
  bool _light = true;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    var _height = mediaQueryData.size.height;
    var _width = mediaQueryData.size.width;

    var controller;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'About',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red.shade100,
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: _height * 0.02, left: _width * 0.04),
                          height: _height * 0.3,
                          width: _width * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFE8E7E7),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: _height * 0.03,
                              ),
                              Icon(
                                Icons.file_copy_rounded,
                                color: Colors.black54,
                                size: 30,
                              ),
                              SizedBox(
                                height: _height * 0.01,
                              ),
                              Text(
                                'Accept Devlpoer Agreement',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 8.0, left: 8, right: 8),
                                child: Text(
                                  'read and agree to the google devloper disctribution agreement.',
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 8,
                                  left: 13,
                                  right: 5,
                                ),
                                child: Text(
                                  'I agree and i am wling to assroint my account regition with the google play devlpoer distribution agreement.',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: _height * 0.02, left: _width * 0.04),
                          height: _height * 0.3,
                          width: _width * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFE8E7E7),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: _height * 0.03,
                              ),
                              Icon(Icons.credit_card,
                                  color: Colors.black54, size: 30),
                              SizedBox(
                                height: _height * 0.01,
                              ),
                              Text(
                                'Credit Card',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: _height * 0.01,
                              ),

                              Padding(
                                padding: EdgeInsets.only(left: 13, right: 5),
                                child: Text(
                                  'make sure you have your credit cand handy to pay the \$25 registation free.',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: _height * 0.02,
                            left: _width * 0.04,
                            right: _width * 0.04,
                          ),
                          height: _height * 0.3,
                          width: _width * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFE8E7E7),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: _height * 0.03,
                              ),
                              Icon(Icons.rocket_launch_sharp,
                                  color: Colors.black54, size: 30),
                              SizedBox(
                                height: _height * 0.01,
                              ),
                              Text(
                                'Review distribution Countries',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: _height * 0.01,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 13, right: 5),
                                child: Text(
                                    'review the can distribution countries where you can distribute.'),
                              ),
                              SizedBox(
                                height: _height * 0.01,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 13,
                                  right: 5,
                                ),
                                child: Text(
                                    'if you are planig to sell apps or in-app products cheak if you can have account in your country.'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: _height * 0.02, left: _width * 0.05),
                        height: _height * 0.23,
                        width: _width * 0.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFFBE0E6)),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: _height * 0.03, left: _width * 0.02),
                        height: _height * 0.2,
                        width: _width * 0.5,
                        child: Image.network('https://www.smsindiahub.in/assets/img/bulk-sms-service-for-eCommerce.png'),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: _height * 0.06, left: _width * 0.5),
                        child: Text(
                          'Want To Convert Innvative App Idea Into Successful Reality ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: _height * 0.18, left: _width * 0.48),
                        height: _height * 0.05,
                        width: _width * 0.45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFFCD2DA)),
                        child: Center(
                          child: Text(
                            'Get Expert Help?',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: _height * 0.02, left: _width * 0.05),
                        height: _height * 0.23,
                        width: _width * 0.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFFBE0E6)),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: _height * 0.06, left: _width * 0.1),
                        child: Text(
                          'Make Sure You Have \nCredit Handy To Pay \nOn \$25 restration \nFree',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: _height * 0.03, left: _width * 0.55),
                        height: _height * 0.2,
                        width: _width * 0.40,
                        child: Image.network('https://bodhtree.com/wp-content/uploads/2016/05/ecommerce.png'),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: _height * 0.18, left: _width * 0.1),
                        height: _height * 0.05,
                        width: _width * 0.45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFFCD2DA)),
                        child: Center(
                            child: Text(
                          'Get Expert Help?',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: _height * 0.02, left: _width * 0.02),
                        height: _height * 0.23,
                        width: _width * 0.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFFBE0E6)),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: _height * 0.03, left: _width * 0.02),
                        height: _height * 0.2,
                        width: _width * 0.5,
                        child: Image.network('https://gdigitaldesh.com/doc/256744_2079999607.png'),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: _height * 0.06, left: _width * 0.5),
                        child: Text(
                          ' Read And Agree\n To The Goole Pay\n Devloper Acount',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: _height * 0.18, left: _width * 0.45),
                        height: _height * 0.05,
                        width: _width * 0.45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFFCD2DA)),
                        child: Center(
                            child: Text(
                          'Get Expert Help?',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: _height * 0.02, left: _width * 0.05),
                        height: _height * 0.23,
                        width: _width * 0.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFFBE0E6)),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: _height * 0.06, left: _width * 0.1),
                        child: Text(
                          'If You Are \nplanning Chaek If\nSell Apps Or \nIn-Apps ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: _height * 0.03, left: _width * 0.5),
                        height: _height * 0.2,
                        width: _width * 0.5,
                        child: Image.network('https://graphicdesignzone.in/wp-content/uploads/2019/12/e-commerce-mobile-app.png'),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: _height * 0.18, left: _width * 0.1),
                        height: _height * 0.05,
                        width: _width * 0.45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFFCD2DA)),
                        child: Center(
                          child: Text(
                            'Get Expert Help?',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
