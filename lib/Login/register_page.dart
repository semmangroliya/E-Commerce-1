import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'User_Detaile.dart';


class REGISTER extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return REGISTERStat();
  }
}

class REGISTERStat extends State<REGISTER> {
  var _email = TextEditingController();
  var _pass = TextEditingController();
  var _name = TextEditingController();
  var _Cpass = TextEditingController();
  var _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var mWidth = mediaQueryData.size.width;
    var mHeight = mediaQueryData.size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://st.depositphotos.com/1019714/4577/v/450/depositphotos_45779539-stock-illustration-flat-and-web-design-banner.jpg',
            ),
            colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            height: mHeight * 0.6,
            width: mWidth * 0.7,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.black.withOpacity(0.7),
                Colors.black.withOpacity(0.7),
              ], begin: Alignment.topCenter),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: RichText(
                    text: TextSpan(
                        text: 'S',
                        style: GoogleFonts.rubik(
                          color: Colors.redAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                              text: 'HO',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.yellowAccent,
                              )),
                          TextSpan(
                              text: 'P   ',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.redAccent,
                              )),
                          TextSpan(
                              text: 'M',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.yellow,
                              )),
                          TextSpan(
                              text: 'E',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.redAccent,
                              )),
                        ]),
                  ),
                ),
                SizedBox(
                  height: mHeight * 0.02,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: TextField(
                          controller: _name,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                            border: InputBorder.none,
                            hintText: 'Name',
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Icon(
                                Icons.account_circle,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: TextField(
                            controller: _phone,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              border: InputBorder.none,
                              hintText: 'Phone No',
                              prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Icon(
                                  Icons.call,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: TextField(
                            controller: _email,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              border: InputBorder.none,
                              hintText: 'Email',
                              prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Icon(
                                  Icons.mail,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: TextField(
                            controller: _pass,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              border: InputBorder.none,
                              hintText: 'Password',
                              prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                            obscureText: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: TextField(
                            controller: _Cpass,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              border: InputBorder.none,
                              hintText: 'Current Possword',
                              prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Icon(
                                  Icons.key,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                            obscureText: true,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          ButtonBar(
                            alignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: mWidth * 0.5,
                                child: Padding(
                                  padding: EdgeInsets.only(),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white70,
                                    ),
                                    onPressed: () async {
                                      await FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                        email: _email.text,
                                        password: _pass.text,
                                      );
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => USER_DETAILE(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'REGISTER',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
