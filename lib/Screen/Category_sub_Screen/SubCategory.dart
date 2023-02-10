import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../../Detaile_Screen/DetaileScreen.dart';
import '../../Model/SingleProModel.dart';
import '../../Widget/SingleProWidget.dart';
import '../../Widget/ToggleButtonWidget.dart';
import '../../data/category-data/Man-Category-data.dart';

class SubCategory extends StatefulWidget {
  List<SingleProModel>? productData;
  final String? productName;
  final String? productModel;

  SubCategory({this.productName, this.productModel, this.productData});

  @override
  State<SubCategory> createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.filter_alt_outlined,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
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
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: mWidth * 0.035),
                  child: Text(
                    widget.productName.toString(),
                    style: TextStyle(
                      fontSize: mHeight * 0.034,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: mHeight * 0.010,
                ),
                Padding(
                  padding: EdgeInsets.only(left: mWidth * 0.035),
                  child: Text(
                    "${widget.productData?.length}",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: mWidth * 0.040,
                    ),
                  ),
                ),
                SizedBox(
                  height: mHeight * 0.020,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.list_alt_sharp,
                        color: Colors.black,
                        size: mHeight * 0.035,
                      ),
                    ),
                    SizedBox(
                      width: mWidth * 0.010,
                    ),
                    Text(
                      widget.productModel.toString(),
                      style: TextStyle(
                        fontSize: mHeight * 0.020,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: mWidth * 0.105),
                      child: ToggleButtonWidget(),
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  primary: true,
                  itemCount: widget.productData!.length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.7),
                  itemBuilder: (context, index) {
                    var Data = widget.productData![index];
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
