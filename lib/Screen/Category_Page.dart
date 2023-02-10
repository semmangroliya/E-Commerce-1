import 'package:flutter/material.dart';
import '../Detaile_Screen/DetaileScreen.dart';
import '../Model/CtegoryProModel.dart';
import '../Widget/Category_Product_Widget.dart';
import '../Widget/SingleProWidget.dart';
import '../data/category-data/Kids_Category_data.dart';
import '../data/category-data/Man-Category-data.dart';
import '../data/category-data/Woman_Category_data.dart';
import '../data/category-data/category.data.dart';
import '../data/home-page-data/home-page-data.dart';
import 'Category_sub_Screen/SubCategory.dart';

class CATEGORY extends StatefulWidget {
  List<CategoryProModel>? categoryProModel = [];

  CATEGORY({this.categoryProModel});

  @override
  State<StatefulWidget> createState() {
    return CATEGORYState();
  }
}

class CATEGORYState extends State<CATEGORY> {
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
                'Man',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: mWidth * 0.030,
                ),
              ),
              Text(
                'Women',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: mWidth * 0.030,
                ),
              ),
              Text(
                'Kids',
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
                          'Shoes',
                          style: TextStyle(
                            fontSize: mHeight * 0.019,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: mWidth * 0.62),
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
                      itemCount: categoryShoesData.length,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (context, index) {
                        var Data = categoryShoesData[index];
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
                  Divider(
                    thickness: 2,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: mWidth * 0.020),
                        child: Text(
                          'Clothes',
                          style: TextStyle(
                            fontSize: mHeight * 0.019,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: mWidth * 0.62),
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
                      itemCount: categoryClothData.length,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (context, index) {
                        var Data = categoryClothData[index];
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
                  Divider(
                    thickness: 2,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: mWidth * 0.020),
                        child: Text(
                          'Accessories',
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
                      itemCount: categoryAccessoriesData.length,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (context, index) {
                        var Data = categoryAccessoriesData[index];
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
              ListView.builder(
                shrinkWrap: true,
                itemCount: menCategoryData.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {

                  var Data = menCategoryData[index];
                  return CategoryProductWidget(
                    onPressed: () {
                      if(index == 0){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubCategory(
                              productModel: MancolothsData[index].productModel,
                              productData: MancolothsData,
                              productName: menCategoryData[index].productName,
                            ),
                          ),
                        );
                      }
                      else if(index == 1){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubCategory(
                              productModel: ManshoesData[index].productModel,
                              productData: ManshoesData,
                              productName: menCategoryData[index].productName,
                            ),
                          ),
                        );
                      }
                      else if(index == 2){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubCategory(
                              productModel: ManaccessoriesData[index].productModel,
                              productData: ManaccessoriesData,
                              productName: menCategoryData[index].productName,
                            ),
                          ),
                        );
                      }
                      else if(index == 3){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubCategory(
                              productModel: ManBackPackData[index].productModel,
                              productData: ManBackPackData,
                              productName: menCategoryData[index].productName,
                            ),
                          ),
                        );
                      }
                      else if(index == 4){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubCategory(
                              productModel: accessoriesData[index].productModel,
                              productData: accessoriesData,
                              productName: menCategoryData[index].productName,
                            ),
                          ),
                        );
                      }
                    },
                    productImage: Data.productImage,
                    productModel: Data.productModel,
                    productName: Data.productName,
                  );
                },
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: womenCategoryData.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  var Data = womenCategoryData[index];
                  return CategoryProductWidget(
                    onPressed: () {
                      if(index == 0){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubCategory(
                              productModel: WomencolothsData[index].productModel,
                              productData: WomencolothsData,
                              productName: womenCategoryData[index].productName,
                            ),
                          ),
                        );
                      }
                      else if(index == 1){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubCategory(
                              productModel: WomenshoesData[index].productModel,
                              productData: WomenshoesData,
                              productName: womenCategoryData[index].productName,
                            ),
                          ),
                        );
                      }
                      else if(index == 2){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubCategory(
                              productModel: WomenaccessoriesData[index].productModel,
                              productData: WomenaccessoriesData,
                              productName: womenCategoryData[index].productName,
                            ),
                          ),
                        );
                      }
                      else if(index == 3){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubCategory(
                              productModel: WomenBackPackData[index].productModel,
                              productData: WomenBackPackData,
                              productName: womenCategoryData[index].productName,
                            ),
                          ),
                        );
                      }
                    },
                    productImage: Data.productImage,
                    productModel: Data.productModel,
                    productName: Data.productName,
                  );
                },
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: forKids.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  var Data = forKids[index];
                  return CategoryProductWidget(
                    onPressed: () {
                      if(index == 0){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubCategory(
                              productModel: KidscolothsData[index].productModel,
                              productData: KidscolothsData,
                              productName: forKids[index].productName,
                            ),
                          ),
                        );
                      }
                      else if(index == 1){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubCategory(
                              productModel: KidsshoesData[index].productModel,
                              productData: KidsshoesData,
                              productName: menCategoryData[index].productName,
                            ),
                          ),
                        );
                      }

                      else if(index == 2){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubCategory(
                              productModel: KidsBackPackData[index].productModel,
                              productData: KidsBackPackData,
                              productName: forKids[index].productName,
                            ),
                          ),
                        );
                      }
                    },
                    productImage: Data.productImage,
                    productModel: Data.productModel,
                    productName: Data.productName,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
