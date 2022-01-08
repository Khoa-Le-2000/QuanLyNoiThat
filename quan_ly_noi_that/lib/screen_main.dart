// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables
// ignore: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quan_ly_noi_that/screen_discount.dart';
import 'package:quan_ly_noi_that/screen_note.dart';
import 'package:quan_ly_noi_that/screen_scan.dart';
import 'package:quan_ly_noi_that/screen_search.dart';
import 'package:quan_ly_noi_that/slide_bar.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color colorBackground = Color(0xff090e20);
  Color colorMain = Color(0xff1c1e32);
  Color colorSecond = Color(0xffe91653);

  Color colorShadow = Color(0xffc9fcff);

  Color mainColor = Color(0xff494eda);
  Color beginColor = Color(0xff6e8ee9);
  Color endColor = Color(0xff474bd9);
  Color titleColor = Color(0xff6f8fea);
  Color buttonColor = Color(0xffe7ecf9);
  Color backgroundColor = Color(0xfff5f6fa);

  Widget contentScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(20),
              color: colorMain,
            ),
            width: double.infinity,
            padding: EdgeInsets.all(30.0),
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 30,
              bottom: 30,
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 25,
                ),
                SizedBox(width: 10),
                Text(
                  "Tìm kiếm sản phẩm",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
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
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(20),
              color: colorMain,
            ),
            width: double.infinity,
            padding: EdgeInsets.all(30.0),
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 30,
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.qr_code_scanner,
                  color: Colors.white,
                  size: 25,
                ),
                SizedBox(width: 10),
                Text(
                  "Quét mã sản phẩm",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
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
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(20),
              color: colorMain,
            ),
            width: double.infinity,
            padding: EdgeInsets.all(30.0),
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 30,
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.receipt,
                  color: Colors.white,
                  size: 25,
                ),
                SizedBox(width: 10),
                Text(
                  "Chương trình khuyến mãi",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
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
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(20),
              color: colorMain,
            ),
            width: double.infinity,
            padding: EdgeInsets.all(30.0),
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 30,
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.note_alt,
                  color: Colors.white,
                  size: 25,
                ),
                SizedBox(width: 10),
                Text(
                  "Ghi chú",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ScreenNote()),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: slideBar(context),
      appBar: AppBar(
        backgroundColor: colorMain,
        title: Text("Quản lý đồ dùng nội thất"),
      ),
      body: Container(
        color: colorBackground,
        child: contentScreen(),
      ),
    );
  }
}
