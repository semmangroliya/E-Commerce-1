import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project/Screen/Home_Page.dart';
import '../Model/Wish_model.dart';
import '../Widget/SingleProWidget.dart';

class WISHLIST extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WISHLISTState();
  }
}

class WISHLISTState extends State<WISHLIST> {
  // SingleProWidget home = SingleProWidget();
  Model model = Model();

  var deletedItem;

  // bool Wish = false;

  // List ls = [];

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   ls = model.getData;
  //   print(ls);
  // }
  bool wish = false;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var mWidth = mediaQueryData.size.width;
    var mHeight = mediaQueryData.size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white.withAlpha(1),
              Colors.red.shade100,
            ],
            begin: Alignment.topCenter,
          ),
        ),
        child: wish
            ? ListView.builder(
                itemCount: Model.ls.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(mWidth * 0.010),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: mHeight * 0.050,
                                    ),
                                    child: Container(
                                      width: mWidth * 0.4,
                                      height: mHeight * 0.2,
                                      margin: EdgeInsetsDirectional.all(
                                          mWidth * 0.010),
                                      alignment: Alignment.topRight,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            '${Model.ls[index]['image']}',
                                          ),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black38,
                                            offset: Offset(
                                              4.0,
                                              4.0,
                                            ),
                                            blurRadius: 10,
                                            spreadRadius: 2,
                                          )
                                        ],
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          var alert = AlertDialog(
                                            title: Text(
                                              '${Model.ls[index]['name']}',
                                            ),
                                            content: Text(
                                              'Deleted \nAre you sure???',
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    wish = false;
                                                  });
                                                  DocumentReference document =
                                                      FirebaseFirestore.instance
                                                          .collection(
                                                              'WishList')
                                                          .doc(
                                                              '${Model.ls[index]['model']}');

                                                  document
                                                      .delete()
                                                      .whenComplete(() {
                                                    print(
                                                        'Remove to WishList...');
                                                  });
                                                  setState(() {
                                                    deletedItem = Model.ls
                                                        .removeAt(index);
                                                    Navigator.pop(context);
                                                  });
                                                  ScaffoldMessenger.of(context)
                                                    ..removeCurrentSnackBar()
                                                    ..hideCurrentSnackBar()
                                                    ..showSnackBar(
                                                      SnackBar(
                                                        duration: Duration(
                                                          seconds: 2,
                                                        ),
                                                        content: Text(
                                                          'This Product is Deleted...',
                                                        ),
                                                        action: SnackBarAction(
                                                          label: 'Undo',
                                                          onPressed: () {
                                                            setState(() {
                                                              wish = true;
                                                            });
                                                            // var data = {
                                                            //   'Name':
                                                            //       '${Model.ls[index]['name']}',
                                                            //   'Model':
                                                            //       '${Model.ls[index]['model']}',
                                                            //   'Image':
                                                            //       '${Model.ls[index]['image']}',
                                                            //   'Price':
                                                            //       '${Model.ls[index]['price']}',
                                                            //   'OldPrice':
                                                            //       '${Model.ls[index]['old']}',
                                                            // };
                                                            //
                                                            // document
                                                            //     .set(data)
                                                            //     .whenComplete(() => {
                                                            //           print(
                                                            //               "User details added...")
                                                            //         });

                                                            Model.ls.insert(
                                                              index,
                                                              deletedItem,
                                                            );
                                                            setState(() {});
                                                          },
                                                        ),
                                                      ),
                                                    );
                                                },
                                                child: Text(
                                                  'Yes',
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  'No',
                                                ),
                                              ),
                                            ],
                                          );
                                          showDialog(
                                            context: context,
                                            builder: (context) => alert,
                                            barrierDismissible: false,
                                          );
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: mHeight * 0.020,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: mWidth * 0.040,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${Model.ls[index]['name']}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: mHeight * 0.010,
                                        ),
                                        Text(
                                          '${Model.ls[index]['model']}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red),
                                        ),
                                        SizedBox(
                                          height: mHeight * 0.010,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '\$ ${Model.ls[index]['price']}',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              width: mWidth * 0.015,
                                            ),
                                            Text(
                                              '\$ ${Model.ls[index]['old']}',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                            ),
                                            SizedBox(
                                              width: mWidth * 0.015,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              )
            :  GestureDetector(
          child: Center(
            child: Image(
              image: NetworkImage(
                'https://cdn.shopify.com/s/files/1/0510/4487/6480/t/11/assets/empty-wishlist.png?v=141658177206755846691632865697',
              ),
            ),
          ),
          onTap: () {
            setState(() {
              wish = true;
            });
          },
        ),

      ),
    );
  }
}

// setState(() {
// wish = true;
// });
