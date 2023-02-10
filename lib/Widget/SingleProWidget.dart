import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Model/Wish_model.dart';

class SingleProWidget extends StatefulWidget {
  final String? productName;
  final String? productImage;
  final String? productModel;
  final double? productPrice;
  final double? productOldPrice;
  final onPressed;


  SingleProWidget({
    this.productName,
    this.productImage,
    this.productModel,
    this.productPrice,
    this.productOldPrice,
    this.onPressed,
    // required this.ls,
  });

  @override
  State<SingleProWidget> createState() => _SingleProWidgetState();
}

class _SingleProWidgetState extends State<SingleProWidget> {
  Model model = Model();
  Map mp = {};
  bool click = true;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var mWidth = mediaQueryData.size.width;
    var mHeight = mediaQueryData.size.height;
    return Padding(
      padding: EdgeInsets.all(mWidth * 0.010),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: widget.onPressed,
                      child: Container(
                        width: mWidth * 0.4,
                        height: mHeight * 0.2,
                        alignment: Alignment.topRight,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              widget.productImage.toString(),
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
                            setState(() {
                              click = !click;
                              createData();
                            });
                            mp.addAll({
                              'image': '${widget.productImage}',
                              'name': '${widget.productName}',
                              'model': '${widget.productModel}',
                              'price': '${widget.productPrice}',
                              'old': '${widget.productOldPrice}'
                            });
                            Model.ls.add(mp);
                          },
                          icon: Icon(
                            (click == false)
                                ? Icons.favorite
                                : Icons.favorite_border,
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.productName.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: mHeight * 0.010,
                          ),
                          Text(
                            widget.productModel.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.red),
                          ),
                          SizedBox(
                            height: mHeight * 0.010,
                          ),
                          Row(
                            children: [
                              Text(
                                '\$ ${widget.productPrice}',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: mWidth * 0.015,
                              ),
                              Text(
                                '\$ ${widget.productOldPrice}',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.lineThrough,
                                ),
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
  }

  createData() {
    DocumentReference document =
    FirebaseFirestore.instance.collection('WishList').doc(widget.productModel);

    var data = {
      'Name': widget.productName,
      'Model': widget.productModel,
      'Image': widget.productImage,
      'Price': widget.productPrice,
      'OldPrice': widget.productOldPrice,
    };

    document.set(data).whenComplete(() => {print("User details added...")});
  }
}
