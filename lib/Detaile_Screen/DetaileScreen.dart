import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Model/Cart_Model.dart';
import '../Model/SingleProModel.dart';
import '../Model/Wish_model.dart';

class DetaileScreen extends StatefulWidget {
  final SingleProModel Data;

  DetaileScreen({required this.Data});

  @override
  State<DetaileScreen> createState() => DetaileScreenState();
}

class DetaileScreenState extends State<DetaileScreen> {
  var color = ['Pink', 'Blue', 'Black', 'Red', 'White', 'Brown'];
  var currentItem = 'Pink';

  var size = ['25', '30', '35', '40', '45', '50'];
  var currentSize = '25';

  CartModel model = CartModel();
  Map mp = {};
  Map map = {};
  bool cart = true;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var mWidth = mediaQueryData.size.width;
    var mHeight = mediaQueryData.size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade100,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Reebok',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.upload,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red.shade100,
              Colors.white.withOpacity(1),
            ],
            begin: Alignment.topCenter,
          ),
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            ListTile(
              leading: RichText(
                text: TextSpan(
                  text: 'S',
                  style: GoogleFonts.rubik(
                    color: Colors.redAccent,
                    fontSize: mHeight * 0.020,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                        text: 'HO',
                        style: TextStyle(
                          fontSize: mHeight * 0.035,
                          color: Colors.yellow,
                        )),
                    TextSpan(
                        text: 'P   ',
                        style: TextStyle(
                          fontSize: mHeight * 0.020,
                          color: Colors.redAccent,
                        )),
                    TextSpan(
                        text: 'M',
                        style: TextStyle(
                          fontSize: mHeight * 0.035,
                          color: Colors.yellow,
                        )),
                    TextSpan(
                      text: 'E',
                      style: TextStyle(
                        fontSize: mHeight * 0.020,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.Data.productName,
                    style: TextStyle(
                      fontSize: mHeight * 0.020,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: mHeight * 0.010,
                  ),
                  Text(
                    widget.Data.productModel,
                    style: TextStyle(
                      fontSize: mHeight * 0.015,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              trailing: Padding(
                padding: EdgeInsets.only(top: mHeight * 0.010),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$ ${widget.Data.productPrice}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: mHeight * 0.020,
                      ),
                    ),
                    SizedBox(
                      height: mHeight * 0.010,
                    ),
                    Text(
                      '\$ ${widget.Data.productOldPrice}',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: mHeight * 0.014,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: mHeight * 0.4,
                        height: mWidth * 0.8,
                        margin: EdgeInsetsDirectional.all(mWidth * 0.030),
                        alignment: Alignment.topRight,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(widget.Data.productImage)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: mHeight * 0.010),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(mHeight * 0.010),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              fillColor: Colors.red,
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            hint: Text('colors'),
                            dropdownColor: Colors.grey.shade200,
                            items: color
                                .map((e) =>
                                DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ))
                                .toList(),
                            onChanged: (newValue) {
                              setState(() {
                                currentItem = newValue.toString();
                              });
                            },
                            value: currentItem,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(mHeight * 0.010),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              fillColor: Colors.red,
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            disabledHint: Text('Size'),
                            dropdownColor: Colors.grey.shade200,
                            items: size
                                .map((e) =>
                                DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ))
                                .toList(),
                            onChanged: (newValue) {
                              setState(() {
                                currentSize = newValue.toString();
                              });
                            },
                            value: currentSize,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    'Decription',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: mHeight * 0.020,
                    ),
                  ),
                  children: [
                    ListTile(
                      title: Wrap(
                        children: [
                          Text(
                            'this woman\'s tank top is designed to help you stay cool. it\'s made of stretchy and breathable fabric that moves heat away from your skin',
                            style: TextStyle(fontSize: mHeight * 0.017),
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\n.\tMaterial',
                                    style: TextStyle(
                                      fontSize: mHeight * 0.023,
                                    ),
                                  ),
                                  Text(
                                    '\n84%\tnylon',
                                    style: TextStyle(
                                      fontSize: mHeight * 0.023,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\n16% elastance',
                                    style: TextStyle(
                                        fontSize: mHeight * 0.017,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\n.\tSize',
                                    style: TextStyle(
                                      fontSize: mHeight * 0.023,
                                    ),
                                  ),
                                  Text(
                                    '\n2XS,\tS,\tM,\tL',
                                    style: TextStyle(
                                      fontSize: mHeight * 0.023,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\n.\tGender',
                                    style: TextStyle(
                                      fontSize: mHeight * 0.023,
                                    ),
                                  ),
                                  Text(
                                    '\nWoman',
                                    style: TextStyle(
                                      fontSize: mHeight * 0.023,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\n.\tProvince',
                                    style: TextStyle(
                                      fontSize: mHeight * 0.023,
                                    ),
                                  ),
                                  Text(
                                    '\nNew York',
                                    style: TextStyle(
                                      fontSize: mHeight * 0.023,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\n.\tCuntry',
                                    style: TextStyle(
                                      fontSize: mHeight * 0.023,
                                    ),
                                  ),
                                  Text(
                                    '\nAmerica',
                                    style: TextStyle(
                                      fontSize: mHeight * 0.023,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: mHeight * 0.010,
                              ),
                              MaterialButton(
                                onPressed: () {},
                                child: Text(
                                  'Size gruide',
                                  style: TextStyle(
                                    fontSize: mHeight * 0.023,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  width: mWidth * 0.9,
                  height: mHeight * 0.050,
                  child: cart == false
                      ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Add To Card',
                    ),
                  )
                      : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellow,
                    ),
                    onPressed: () {
                      createData();
                      setState(() {
                        cart = !cart;
                      });
                      mp.addAll({
                        'image': '${widget.Data.productImage}',
                        'name': '${widget.Data.productName}',
                        'model': '${widget.Data.productModel}',
                        'price': '${widget.Data.productPrice}',
                        'old': '${widget.Data.productOldPrice}'
                      });
                      CartModel.list.add(mp);
                      map.addAll({
                        'price': '${widget.Data.productPrice}',
                      });
                      total.ls.add(map);
                    },
                    child: Text(
                      'Add To Card',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  createData() {
    DocumentReference document =
    FirebaseFirestore.instance.collection('Cart').doc(widget.Data.productModel);

    var data = {
      'Name': widget.Data.productName,
      'Model': widget.Data.productModel,
      'Image': widget.Data.productImage,
      'Price': widget.Data.productPrice,
      'OldPrice': widget.Data.productOldPrice,
    };

    document.set(data).whenComplete(() => {print("Cart details added...")});
  }
}
