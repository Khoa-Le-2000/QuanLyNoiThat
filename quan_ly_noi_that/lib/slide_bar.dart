import 'package:flutter/material.dart';
import 'package:quan_ly_noi_that/screen_discount.dart';
import 'package:quan_ly_noi_that/screen_login.dart';
import 'package:quan_ly_noi_that/screen_main.dart';
import 'package:quan_ly_noi_that/screen_note.dart';
import 'package:quan_ly_noi_that/screen_scan.dart';
import 'package:quan_ly_noi_that/screen_search.dart';

Color colorBackground = const Color(0xff090e20);
Color colorMain = const Color(0xff1c1e32);
Color colorSecond = const Color(0xffe91653);

Color colorShadow = const Color(0xffc9fcff);

Color mainColor = const Color(0xff494eda);
Color beginColor = const Color(0xff6e8ee9);
Color endColor = const Color(0xff474bd9);
Color titleColor = const Color(0xff6f8fea);
Color buttonColor = const Color(0xffe7ecf9);
Color backgroundColor = const Color(0xfff5f6fa);

Widget slideBar(BuildContext context) {
  return SizedBox(
    width: 230,
    child: Drawer(
      backgroundColor: colorMain,
      child: ListView(
        children: [
          InkWell(
            child: Container(
              child: Row(
                children: const [
                  Icon(Icons.home, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(15.0),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScreenHome(),
                ),
              );
            },
          ),
          InkWell(
            child: Container(
              child: Row(
                children: const [
                  Icon(Icons.account_circle, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Quản lý tài khoản",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(15.0),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScreenSearch(),
                ),
              );
            },
          ),
          InkWell(
            child: Container(
              child: Row(
                children: const [
                  Icon(Icons.search, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Tìm kiếm sản phẩm",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(15.0),
            ),
            onTap: () {},
          ),
          InkWell(
            child: Container(
              child: Row(
                children: const [
                  Icon(Icons.qr_code_scanner, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Quét mã sản phẩm",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(15.0),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ScreenScan()),
              );
            },
          ),
          InkWell(
            child: Container(
              child: Row(
                children: const [
                  Icon(Icons.receipt, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Chương trình khuyến mãi",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(15.0),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ScreenDiscount()),
              );
            },
          ),
          InkWell(
            child: Container(
              child: Row(
                children: const [
                  Icon(Icons.note_alt, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Ghi chú",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(15.0),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ScreenNote()),
              );
            },
          ),
          InkWell(
            child: Container(
              child: Row(
                children: const [
                  Icon(Icons.logout, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Đăng xuất",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(15.0),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenLogin(),
                  ));
            },
          ),
        ],
      ),
    ),
  );
}
