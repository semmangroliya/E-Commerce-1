import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project/Login/User_Detaile.dart';
import 'package:project/Login/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'forget_pass.dart';

class LOGIN extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LOGINStat();
  }
}

class LOGINStat extends State<LOGIN> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

  GoogleSignIn googleSignIn = GoogleSignIn();
  bool _isVisible = false;
  bool isSignIn = false;
  SharedPreferences? sp;
  bool? bl;
  bool chnagebutton = false;

  var _key = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

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
              'https://st.depositphotos.com/1019714/4577/v/950/depositphotos_45779539-stock-illustration-flat-and-web-design-banner.jpg',
            ),
            colorFilter: ColorFilter.mode(
              Colors.black38,
              BlendMode.darken,
            ),
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
                  padding: EdgeInsets.only(top: mHeight * 0.04),
                  child: RichText(
                    text: TextSpan(
                        text: 'S',
                        style: GoogleFonts.rubik(
                          color: Colors.redAccent,
                          fontSize: mHeight * 0.025,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                              text: 'HO',
                              style: TextStyle(
                                fontSize: mHeight * 0.040,
                                color: Colors.yellow,
                              )),
                          TextSpan(
                              text: 'P   ',
                              style: TextStyle(
                                fontSize: mHeight * 0.025,
                                color: Colors.redAccent,
                              )),
                          TextSpan(
                              text: 'M',
                              style: TextStyle(
                                fontSize: mHeight * 0.040,
                                color: Colors.yellow,
                              )),
                          TextSpan(
                              text: 'E',
                              style: TextStyle(
                                fontSize: mHeight * 0.025,
                                color: Colors.redAccent,
                              )),
                        ]),
                  ),
                ),
                SizedBox(
                  height: mHeight * 0.02,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: mWidth * 0.03),
                  child: Form(
                    key: _key,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: mHeight * 0.01),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: TextFormField(
                              controller: _email,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: mHeight * 0.025,
                                ),
                                border: InputBorder.none,
                                hintText: 'Email',
                                prefixIcon: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: mHeight * 0.03),
                                  child: Icon(
                                    Icons.mail,
                                    color: Colors.white,
                                    size: mHeight * 0.03,
                                  ),
                                ),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: mHeight * 0.01),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: TextFormField(
                              controller: _pass,
                              obscureText: !_isVisible,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: mHeight * 0.025,
                                ),
                                border: InputBorder.none,
                                hintText: 'Password',
                                prefixIcon: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: mWidth * 0.05),
                                  child: Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                    size: mHeight * 0.03,
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  color: Color(0xFFC41A3B),
                                  onPressed: () {
                                    setState(() {
                                      _isVisible = !_isVisible;
                                    });
                                  },
                                  icon: _isVisible
                                      ? Icon(
                                          color: Color(0xFFC41A3B),
                                          Icons.visibility,
                                        )
                                      : Icon(
                                          Icons.visibility_off,
                                          color: Colors.grey,
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FORGET(),
                              ),
                            );
                          },
                          child: Text(
                            'Forget password?',
                            style: TextStyle(color: Colors.white60),
                          ),
                        ),
                        Column(
                          children: [
                            ButtonBar(
                              alignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: mWidth * 0.5,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.redAccent,
                                    ),
                                    onPressed: () async {
                                      if (_email.text.isNotEmpty &&
                                          _pass.text.isNotEmpty) {
                                        await Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  USER_DETAILE(),
                                            ),
                                                (route) => false);
                                      } else {
                                        showDialog(
                                          context: context,
                                          builder: ((context) {
                                            return Container(
                                              child: AlertDialog(
                                                title: Center(
                                                  child: RichText(
                                                    text: TextSpan(
                                                      text: 'S',
                                                      style: GoogleFonts.rubik(
                                                        color: Colors.redAccent,
                                                        fontSize: mHeight * 0.025,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                            text: 'HO',
                                                            style: TextStyle(
                                                              fontSize: mHeight * 0.040,
                                                              color: Colors.yellow,
                                                            )),
                                                        TextSpan(
                                                            text: 'P   ',
                                                            style: TextStyle(
                                                              fontSize: mHeight * 0.025,
                                                              color: Colors.redAccent,
                                                            )),
                                                        TextSpan(
                                                          text: 'M',
                                                          style: TextStyle(
                                                            fontSize: mHeight * 0.040,
                                                            color: Colors.yellow,
                                                          ),),
                                                        TextSpan(
                                                          text: 'E',
                                                          style: TextStyle(
                                                            fontSize: mHeight * 0.025,
                                                            color: Colors.redAccent,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                content: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: mWidth * 0.10),
                                                  child: Text(
                                                    'Please Enter your id & pass',
                                                  ),
                                                ),
                                                actions: [
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.all(8.0),
                                                        child: InkWell(
                                                          child: Container(
                                                            alignment: Alignment.center,
                                                            height: mHeight * 0.040,
                                                            width: mWidth * 0.250,
                                                            decoration: BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius.circular(15),
                                                              color: Colors.red,
                                                            ),
                                                            child: Text(
                                                              'YES',
                                                              style: TextStyle(
                                                                  fontSize: mHeight * 0.020,
                                                                  color: Colors.white),
                                                            ),
                                                          ),
                                                          onTap: () {
                                                            Navigator.pop(context);
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            );
                                          }),
                                        );
                                      }
                                      var email = _email.text;
                                      await FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                              email: _email.text,
                                              password: _pass.text);
                                      await Get.to(USER_DETAILE());
                                    },
                                    child: Text(
                                      'Login',
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
                ),
                Center(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: mWidth * 0.1),
                        child: Text(
                          'Dont Have Account ? ',
                          style: TextStyle(
                            color: Colors.white60,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => REGISTER(),
                            ),
                          );
                        },
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: mWidth * 0.17),
                        child: Container(
                          width: mWidth * 0.11,
                          child: FloatingActionButton(
                            heroTag: null,
                            backgroundColor: Colors.white,
                            onPressed: () async {
                              await _SignIn();
                              SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                              pref.setString("email", "useremail@gmail.com");
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) {
                                    return USER_DETAILE();
                                  },
                                ),
                              );
                            },
                            child: Image.network(
                              'https://www.edigitalagency.com.au/wp-content/uploads/Google-logo-png-plants.png',
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: mWidth * 0.05),
                          child: Text(
                            'OR',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: mWidth * 0.05,
                        ),
                        child: Container(
                          width: mWidth * 0.11,
                          child: FloatingActionButton(
                            heroTag: null,
                            backgroundColor: Colors.white,
                            onPressed: () {},
                            child: Image.network(
                              'https://www.pngarts.com/files/10/Facebook-Logo-Transparent.png',
                            ),
                          ),
                        ),
                      )
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

  _SignIn() async {
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? googleSignInAuth =
          await googleUser?.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuth?.accessToken,
        idToken: googleSignInAuth?.idToken,
      );
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      print(userCredential.user?.displayName);
      setState(() {
        isSignIn = true;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => USER_DETAILE(),
          ),
        );
      },
      );
    } catch (error) {
      print(error);
    }
  }

   loadData() async{
     sp = await SharedPreferences.getInstance();
     setState(() {
      bl = sp!.getBool('BOOl') ?? false;
     });
   }
}



