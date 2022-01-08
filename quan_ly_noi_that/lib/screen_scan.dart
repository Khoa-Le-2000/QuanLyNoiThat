import 'package:flutter/material.dart';
import 'package:quan_ly_noi_that/slide_bar.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScreenScan extends StatelessWidget {
  const ScreenScan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaner(),
    );
  }
}

class Scaner extends StatefulWidget {
  const Scaner({Key? key}) : super(key: key);

  @override
  _ScanerState createState() => _ScanerState();
}

class _ScanerState extends State<Scaner> {
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

  final GlobalKey qrkey = GlobalKey(debugLabel: "QR");
  Barcode? result;
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: slideBar(context),
      appBar: AppBar(
        title: const Text(
          "Quét mã sản phẩm",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: colorMain,
      ),
      body: Container(
        color: colorBackground,
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: QRView(
                key: qrkey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: (result != null)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "Sản phẩm: Ghế thông minh",
                            style: TextStyle(color: Colors.white),
                          ),
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(20),
                                color: colorMain,
                              ),
                              padding: const EdgeInsets.all(5.0),
                              child: const Text(
                                "Xem chi tiết",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            onTap: () {},
                          )
                        ],
                      )
                    : const Text(
                        "Chưa tìm thấy mã sản phẩm",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
