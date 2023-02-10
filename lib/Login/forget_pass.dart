import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Bottom_Bar.dart';
import 'User_Detaile.dart';

class FORGET extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FORGETStat();
  }
}

class FORGETStat extends State<FORGET> {
  var _email = TextEditingController();
  var _pass = TextEditingController();


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
                Text(
                  'Forgot Password?',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 10),
                  child: Text(
                    'Retrive your Password',
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white30),

                  ),
                ),
                SizedBox(
                  height: mHeight * 0.05,
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
                                      primary: Colors.redAccent,
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
                                      'Submit',
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
