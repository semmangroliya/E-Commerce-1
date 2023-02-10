import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controller/Cart_Controllet.dart';
import '../Model/Cart_Model.dart';

class CART extends StatefulWidget {
  final double? productPrice;

  CART({
    this.productPrice,
  });

  @override
  State<StatefulWidget> createState() {
    return CARTState();
  }
}

class CARTState extends State<CART> {
  final CART_Conroller cart_Conroller = CART_Conroller();

  var deletedItem;
  var items = [];

  var bill = 0;

  bool cart = false;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var mWidth = mediaQueryData.size.width;
    var mHeight = mediaQueryData.size.height;
    return Scaffold(
      body: Stack(children: [
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
          child: cart
              ? ListView.builder(
                  itemCount: CartModel.list.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(mWidth * 0.010),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              '${CartModel.list[index]['image']}',
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
                                                '${CartModel.list[index]['name']}',
                                              ),
                                              content: Text(
                                                'Deleted \nAre you sure???',
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      cart = false;
                                                    });
                                                    DocumentReference document =
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection('Cart')
                                                            .doc(
                                                                '${CartModel.list[index]['model']}');

                                                    document
                                                        .delete()
                                                        .whenComplete(() {
                                                      print(
                                                          'Remove to Cart...');
                                                    });
                                                    setState(() {
                                                      deletedItem = CartModel
                                                          .list
                                                          .removeAt(index);
                                                      Navigator.pop(context);
                                                    });
                                                    ScaffoldMessenger.of(
                                                        context)
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
                                                          action:
                                                              SnackBarAction(
                                                            label: 'Undo',
                                                            onPressed: () {
                                                              setState(() {
                                                                cart = true;
                                                              });
                                                              CartModel.list
                                                                  .insert(
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
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: mHeight * 0.045),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${CartModel.list[index]['name']}',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: mHeight * 0.010,
                                            ),
                                            Text(
                                              '${CartModel.list[index]['model']}',
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
                                                  '\$ ${CartModel.list[index]['price']}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: mWidth * 0.015,
                                                ),
                                                Text(
                                                  '\$ ${CartModel.list[index]['old']}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      decoration: TextDecoration
                                                          .lineThrough),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: mWidth * 0.015,
                                            ),
                                            Row(
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      cart_Conroller
                                                          .decrement();
                                                    });
                                                  },
                                                  icon: Icon(
                                                    Icons.remove_circle,
                                                    color: Colors.yellow,
                                                  ),
                                                ),
                                                Obx(() => Text(
                                                    '${cart_Conroller.items.toString()}')),
                                                IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      cart_Conroller
                                                          .increment();
                                                    });
                                                  },
                                                  icon: Icon(
                                                    Icons.add_circle,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
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
              : Center(
                  child: GestureDetector(
                    child: Center(
                      child: Image(
                        image: NetworkImage(
                          'https://www.ipack.com/media/icons/empty-cart-ipack.png',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        cart = true;
                      });
                    },
                  ),
                ),
        ),
      ]),
    );
  }
}
