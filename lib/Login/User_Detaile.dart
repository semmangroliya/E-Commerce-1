import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Bottom_Bar.dart';

class USER_DETAILE extends StatefulWidget {
  @override
  State<USER_DETAILE> createState() => USER_DETAILEState();
}

class USER_DETAILEState extends State<USER_DETAILE> {
  TextEditingController _fname = TextEditingController();
  TextEditingController _lname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _add = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _number = TextEditingController();

  String? fname, lname, email, add, city, number;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var mWidth = mediaQueryData.size.width;
    var mHeight = mediaQueryData.size.height;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withAlpha(1),
                    Colors.red.shade100,
                  ],
                  begin: Alignment.topCenter,
                ),
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: mWidth * 0.8,
                      child: Image.network(
                        'https://www.clavistechnologies.com/wp-content/uploads/2016/11/ecommerce-app.png',
                      ),
                    ),
                    SizedBox(
                      height: mHeight * 0.020,
                    ),
                    Text(
                      'Lets Set Up Your Profile',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.red),
                    ),
                    SizedBox(
                      height: mHeight * 0.015,
                    ),
                    Text(
                      'We use this infromation to set up your payment and shipping methodes.you can change this infromation any time later in the profile section.',
                      style: TextStyle(fontSize: mHeight * 0.020),
                    ),
                    SizedBox(
                      height: mHeight * 0.020,
                    ),
                    TextFormField(
                      controller: _fname,
                      onChanged: (value) {
                        fname = value;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.yellow.shade100,
                        hintText: "Your Name",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        prefixIcon: Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: mWidth * 0.05),
                          child: Icon(
                            Icons.drive_file_rename_outline,
                            color: Colors.red,
                            size: mHeight * 0.03,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mHeight * 0.020,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        lname = value;
                      },
                      controller: _lname,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.yellow.shade100,
                        hintText: "Surname",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        prefixIcon: Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: mWidth * 0.05),
                          child: Icon(
                            Icons.drive_file_rename_outline,
                            color: Colors.red,
                            size: mHeight * 0.03,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mHeight * 0.020,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      controller: _email,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.yellow.shade100,
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        prefixIcon: Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: mWidth * 0.05),
                          child: Icon(
                            Icons.email,
                            color: Colors.red,
                            size: mHeight * 0.03,
                          ),
                        ),
                      ),
                      autovalidateMode:
                      AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'User Email Can\'t Emoty';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: mHeight * 0.020,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        add = value;
                      },
                      controller: _add,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.yellow.shade100,
                        hintText: "Address",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        prefixIcon: Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: mWidth * 0.05),
                          child: Icon(
                            Icons.home_work_outlined,
                            color: Colors.red,
                            size: mHeight * 0.03,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mHeight * 0.020,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        city = value;
                      },
                      controller: _city,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.yellow.shade100,
                        hintText: "City",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        prefixIcon: Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: mWidth * 0.05),
                          child: Icon(
                            Icons.location_city,
                            color: Colors.red,
                            size: mHeight * 0.03,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mHeight * 0.020,
                    ),
                    TextFormField(
                        onChanged: (value) {
                          number = value;
                        },
                        controller: _number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.yellow.shade100,
                          hintText: "Number",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          prefixIcon: Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: mWidth * 0.05),
                            child: Icon(
                              Icons.call,
                              color: Colors.red,
                              size: mHeight * 0.03,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.length < 10) {
                            return 'User Password Can\'t Emoty';
                          } else if (value.length > 10) {
                            return 'User Password Can\'t Emoty';
                          } else {
                            return null;
                          }

                        }
                    ),
                    SizedBox(
                      height: mHeight * 0.020,
                    ),
                    Container(
                      width: mWidth * 0.9,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.redAccent,
                        ),
                        child: Text(
                          "N E X T",
                          style: TextStyle(
                              fontSize: mWidth * 0.045,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        onPressed: () {
                          createData();
                          if (_fname.text.isNotEmpty &&
                              _lname.text.isNotEmpty &&
                              _email.text.isNotEmpty &&
                              _add.text.isNotEmpty &&
                              _city.text.isNotEmpty &&
                              _number.text.isNotEmpty) {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>   NEVBAR(
                              fname: _fname.text,
                              lname: _lname.text,
                              email: _email.text,
                              add: _add.text,
                              city: _city.text,
                              phone: _number.text,
                            ),), (route) => false);
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
                                        'Please fill all details',
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
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  createData() {
    DocumentReference document =
    FirebaseFirestore.instance.collection('user detailes').doc(fname);

    var data = {
      'fname': fname,
      'lname': lname,
      'email': email,
      'city': city,
      'add': add,
      'number': number
    };

    document.set(data).whenComplete(() => {print("User details added...")});
  }
}
