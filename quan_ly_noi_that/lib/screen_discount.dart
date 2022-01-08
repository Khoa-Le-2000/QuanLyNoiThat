import 'package:flutter/material.dart';
import 'package:quan_ly_noi_that/slide_bar.dart';

class ScreenDiscount extends StatelessWidget {
  const ScreenDiscount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Discount(),
    );
  }
}

class Discount extends StatefulWidget {
  const Discount({Key? key}) : super(key: key);

  @override
  _DiscountState createState() => _DiscountState();
}

class _DiscountState extends State<Discount> {
  Widget titleContent(String title, String content,
      [Color colorContent = Colors.white]) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        Text(
          content,
          style: TextStyle(
            color: colorContent,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  Widget item(String programName, String rangeItem, String rangeCustomer,
      String timeApply,
      [int type = 1]) {
    var colorTime = Colors.green;
    if (type == 0) colorTime = Colors.blue;
    if (type == 2) colorTime = Colors.red;

    return Container(
      decoration: BoxDecoration(
        color: colorMain,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white),
      ),
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
      margin: const EdgeInsets.fromLTRB(5, 20, 5, 0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                titleContent("Tên chương trình: ", programName),
                const SizedBox(height: 5),
                titleContent("Phạm vi sản phẩm: ", rangeItem),
                const SizedBox(height: 5),
                titleContent("Phạm vi khách hàng: ", rangeCustomer),
                const SizedBox(height: 5),
                titleContent("Thời gian: ", timeApply, colorTime),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: Colors.white,
            size: 50,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: slideBar(context),
      appBar: AppBar(
        title: const Text('Chương trình khuyến mãi'),
        backgroundColor: colorMain,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: colorBackground,
          child: Column(
            children: [
              item(
                'Tri ân khách hàng',
                'Toàn bộ',
                'Khách hàng cũ',
                'Tháng 1 / 2022',
              ),
              item(
                'Giảm giá đồ gỗ',
                'Sản phẩm đồ gỗ',
                'Toàn bộ',
                '01/01/2022 - 15/01/2022',
              ),
              item(
                'Khuyến mãi tết',
                'Sofa',
                'Toàn bộ',
                '15/01/2022 - 29/01/2022',
                0,
              ),
              item(
                'Chương trình Hòa Phát',
                'Sản phẩm Hòa Phát',
                'Toàn bộ',
                '15/12/2021 - 31/12/2021',
                2,
              ),
              item(
                'Tri ân khách hàng',
                'Toàn bộ',
                'Khách hàng cũ',
                'Tháng 1 / 2022',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
