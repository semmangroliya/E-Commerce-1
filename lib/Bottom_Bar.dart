import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project/about.dart';
import 'Login/User_Detaile.dart';
import 'Screen/Cart_Page.dart';
import 'Screen/Category_Page.dart';
import 'Screen/Home_Page.dart';
import 'Screen/User_Page.dart';
import 'Screen/WishList_Page.dart';

class NEVBAR extends StatefulWidget {
  String fname, lname, email, add, city, phone;

  NEVBAR(
      {required this.fname,
      required this.lname,
      required this.email,
      required this.add,
      required this.city,
      required this.phone});

  @override
  State<StatefulWidget> createState() {
    return NEVBARState();
  }
}

class NEVBARState extends State<NEVBAR> {
  int _selectedIndex = 0;

  void changeSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var mWidth = mediaQueryData.size.width;
    var mHeight = mediaQueryData.size.height;
    var ls = [
      HOME(),
      CATEGORY(),
      CART(),
      WISHLIST(),
      USER(
        fname: widget.fname,
        lname: widget.lname,
        email: widget.email,
        add: widget.add,
        city: widget.city,
        phone: widget.phone,
      ),
    ];
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                
                color: Colors.red.shade100,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        widget.fname,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: mWidth * 0.020),
                        child: Text(
                          widget.lname,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        widget.email,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              selected: _selectedIndex == 0,
              leading: Icon(
                Icons.home,
                size: mHeight * 0.03,
              ),
              title: Text(
                'HOME',
              ),
              onTap: () {
                changeSelected(0);
              },
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              selected: _selectedIndex == 1,
              leading: Icon(
                Icons.category,
                size: mHeight * 0.03,
              ),
              title: Text(
                'CATEGORY',
              ),
              onTap: () {
                changeSelected(1);
              },
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              selected: _selectedIndex == 2,
              leading: Icon(
                Icons.shopping_cart,
                size: mHeight * 0.03,
              ),
              title: Text(
                'CART',
              ),
              onTap: () {
                changeSelected(2);
              },
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              selected: _selectedIndex == 3,
              leading: Icon(
                Icons.favorite,
                size: mHeight * 0.03,
              ),
              title: Text(
                'WISHLIST',
              ),
              onTap: () {
                changeSelected(3);
              },
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              selected: _selectedIndex == 4,
              leading: Icon(
                Icons.account_circle,
                size: mHeight * 0.03,
              ),
              title: Text(
                'USER',
              ),
              onTap: () {
                changeSelected(4);
              },
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              selected: _selectedIndex == 5,
              leading: Icon(
                Icons.question_mark,
                size: mHeight * 0.03,
              ),
              title: Text(
                'ABOUT',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ABOUT(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: mWidth * 0.10),
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: mWidth * 0.010),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.filter_alt_outlined,
                  color: Colors.black,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: ls.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        color: Colors.red.shade100,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: mWidth * 0.030, vertical: mHeight * 0.020),
          child: GNav(
            gap: 8,
            activeColor: Colors.redAccent,
            tabBackgroundColor: Colors.redAccent.withOpacity(0.1),
            tabShadow: [
              BoxShadow(
                color: Colors.redAccent.withOpacity(0.1),
              ),
            ],
            curve: Curves.bounceIn,
            padding: EdgeInsets.all(10),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'HOME',
              ),
              GButton(
                icon: Icons.category,
                text: 'CATEGORY',
              ),
              GButton(
                icon: Icons.shopping_cart,
                text: 'CART',
              ),
              GButton(
                icon: Icons.favorite_rounded,
                text: 'WISHLIST',
              ),
              GButton(
                icon: Icons.account_circle,
                text: 'USER',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
