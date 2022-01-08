import 'package:flutter/material.dart';
import 'package:quan_ly_noi_that/slide_bar.dart';
import 'package:intl/intl.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Search(),
    );
  }
}

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var txtSearch = TextEditingController();

  Widget titleContent(String title, String content) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        Text(
          content,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  Widget item(String img, String itemName, int price, String discount) {
    var formatter = NumberFormat('###,###,###');
    return Container(
      decoration: BoxDecoration(
        color: colorMain,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white),
      ),
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
      margin: const EdgeInsets.all(5),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.network(
              img,
              fit: BoxFit.fitHeight,
              height: 70,
              width: 70,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                titleContent("Sản phẩm: ", itemName),
                const SizedBox(height: 5),
                titleContent("Giá: ", formatter.format(price)),
                const SizedBox(height: 5),
                titleContent("Giảm giá: ", discount),
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
        backgroundColor: colorMain,
        title: const Text(
          "Tìm kiếm sản phẩm",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: colorBackground,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 16, 5, 16),
              child: TextFormField(
                controller: txtSearch,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: colorMain,
                  hintText: "Nhập để tìm kiếm thông tin",
                  hintStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    item(
                      'http://product.hstatic.net/1000181810/product/ghe-nhua-chan-go-eames-trang-1_c39e0ca6959c41bcac18f8b5544a959a_grande.jpg',
                      'Ghế trắng',
                      120000,
                      'Không có',
                    ),
                    item(
                      'https://hoaphat.net/images/202107/goods_img/ghe-luoi-gl203_G568.jpg',
                      'Ghế lưới hòa phát',
                      560000,
                      '10% còn 500,000',
                    ),
                    item(
                      'https://badova.net/wp-content/uploads/2019/09/Ghe-Bingo-go-tu-nhien.jpg',
                      'Ghế gỗ tự nhiên',
                      869000,
                      'Mua 3 tặng 1',
                    ),
                    item(
                      'https://anphat.com.vn/media/product/38251_e_dra_hera_egc224_pink__1_.jpg',
                      'Ghế E-Dra HERA',
                      3089000,
                      'Tặng kèm thảm',
                    ),
                    item(
                      'https://product.hstatic.net/1000380002/product/ghe-cao-vuong-bong-iki50_42844b7146f3488b90ab813c89064673_master.jpg',
                      'Ghế nhựa vuông',
                      71000,
                      '10% mua trên 10 cái',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
