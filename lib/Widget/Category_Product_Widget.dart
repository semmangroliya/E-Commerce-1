import 'package:flutter/material.dart';

class CategoryProductWidget extends StatefulWidget {
  final String? productName;
  final String? productImage;
  final String? productModel;
  final  onPressed;

  CategoryProductWidget({
    this.productName,
    this.productImage,
    this.productModel,
    this.onPressed,
    // required this.ls,
  });
  @override
  State<CategoryProductWidget> createState() => _CategoryProductWidgetState();
}

class _CategoryProductWidgetState extends State<CategoryProductWidget> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var mWidth = mediaQueryData.size.width;
    var mHeight = mediaQueryData.size.height;
    return GestureDetector(
      onTap: widget.onPressed,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: mHeight * 0.050),
              child: Image.network(
                widget.productImage.toString(),
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(right: mHeight * 0.080, top: mHeight * 0.065),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.productName.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: mHeight * 0.020,
                  ),
                ),
                SizedBox(
                  height: mHeight * 0.010,
                ),
                Text(
                  widget.productModel.toString(),
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: mHeight * 0.015,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: mHeight * 0.050, right: mWidth * 0.025),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
