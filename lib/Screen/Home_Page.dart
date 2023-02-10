import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../Detaile_Screen/DetaileScreen.dart';
import '../Widget/SingleProWidget.dart';
import '../data/home-page-data/home-page-data.dart';

class HOME extends StatefulWidget {

  final String? user_fname;
  final String? user_lname;
  final String? user_email;
  final String?  user_add;
  final String? user_city;
  final String? user_number;

  HOME( {
    this.user_fname,
    this.user_lname,
    this.user_email,
    this.user_add,
    this.user_city,
    this.user_number,
  });
  @override
  State<StatefulWidget> createState() {
    return HOMEState();
  }
}

class HOMEState extends State<HOME> {
  File? imageFile;

  ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var mWidth = mediaQueryData.size.width;
    var mHeight = mediaQueryData.size.height;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          bottom: TabBar(
            // indicator: BoxDecoration(
            //   color: Colors.transparent
            // ),
            // indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Colors.pink,
            // labelColor: Colors.redAccent,
            indicatorColor: Colors.redAccent,
            tabs: [
              Text(
                'All',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: mWidth * 0.030,
                ),
              ),
              Text(
                'Clothing',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: mWidth * 0.030,
                ),
              ),
              Text(
                'Shoes',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: mWidth * 0.030,
                ),
              ),
              Text(
                'Accesories',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: mWidth * 0.030,
                ),
              ),
            ],
          ),
        ),
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
          child: TabBarView(
            children: [
              ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: mWidth * 0.020),
                        child: Text(
                          'New Arrival',
                          style: TextStyle(
                            fontSize: mHeight * 0.021,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: mWidth * 0.52),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Show All',
                            style: TextStyle(
                              fontSize: mHeight * 0.019,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: mWidth * 0.025,
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      primary: true,
                      itemCount: singleProData.length,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (context, index) {
                        var Data = singleProData[index];
                        return SingleProWidget(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetaileScreen(
                                  Data: Data,
                                ),
                              ),
                            );
                          },
                          productImage: Data.productImage,
                          productModel: Data.productModel,
                          productName: Data.productName,
                          productOldPrice: Data.productOldPrice,
                          productPrice: Data.productPrice,
                          // ls: [],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: mHeight * 0.020,
                  ),
                ],
              ),

              ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: mWidth * 0.020),
                        child: Text(
                          'New Clothes',
                          style: TextStyle(
                            fontSize: mHeight * 0.019,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: mWidth * 0.52),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Show All',
                            style: TextStyle(
                              fontSize: mHeight * 0.019,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: mWidth * 0.025,
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      primary: true,
                      itemCount: colothsData.length,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (context, index) {
                        var Data = colothsData[index];
                        return SingleProWidget(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetaileScreen(
                                  Data: Data,
                                ),
                              ),
                            );
                          },
                          productImage: Data.productImage,
                          productModel: Data.productModel,
                          productName: Data.productName,
                          productOldPrice: Data.productOldPrice,
                          productPrice: Data.productPrice,
                          // ls: [],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: mHeight * 0.020,
                  ),
                ],
              ),
              ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: mWidth * 0.020),
                        child: Text(
                          'New Shoes',
                          style: TextStyle(
                            fontSize: mHeight * 0.019,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: mWidth * 0.52),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Show All',
                            style: TextStyle(
                              fontSize: mHeight * 0.019,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: mWidth * 0.025,
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      primary: true,
                      itemCount: shoesData.length,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (context, index) {
                        var Data = shoesData[index];
                        return SingleProWidget(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetaileScreen(
                                  Data: Data,
                                ),
                              ),
                            );
                          },
                          productImage: Data.productImage,
                          productModel: Data.productModel,
                          productName: Data.productName,
                          productOldPrice: Data.productOldPrice,
                          productPrice: Data.productPrice,
                          // ls: [],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: mHeight * 0.020,
                  ),
                ],
              ),
              ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: mWidth * 0.020),
                        child: Text(
                          'New Accesories',
                          style: TextStyle(
                            fontSize: mHeight * 0.019,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: mWidth * 0.45),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Show All',
                            style: TextStyle(
                              fontSize: mHeight * 0.019,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: mWidth * 0.025,
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      primary: true,
                      itemCount: accessoriesData.length,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (context, index) {
                        var Data = accessoriesData[index];
                        return SingleProWidget(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetaileScreen(
                                  Data: Data,
                                ),
                              ),
                            );
                          },
                          productImage: Data.productImage,
                          productModel: Data.productModel,
                          productName: Data.productName,
                          productOldPrice: Data.productOldPrice,
                          productPrice: Data.productPrice,
                          // ls: [],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: mHeight * 0.020,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  pickImageFromCamera() async {
    XFile? imageData = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imageFile = File(imageData!.path);
    });
  }

  pickImageFromGallery() async {
    XFile? imageData = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = File(imageData!.path);
    });
  }
}
