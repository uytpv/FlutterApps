import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Để sử dụng Clipboard
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barcode Scanner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BarcodeScannerScreen(),
    );
  }
}

class BarcodeScannerScreen extends StatefulWidget {
  const BarcodeScannerScreen({super.key});

  @override
  State<BarcodeScannerScreen> createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  String _scanBarcodeResult = 'Chưa quét mã nào';

  // Hàm để bắt đầu quét mã vạch
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', // Màu của đường quét
          'Hủy',    // Text nút hủy
          true,      // Hiện đèn flash
          ScanMode.BARCODE); // Chế độ quét (BARCODE, QR, DEFAULT)
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Lỗi khi quét mã.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcodeResult = barcodeScanRes;
    });

    // Nếu quét thành công (không phải là -1 hoặc lỗi)
    if (barcodeScanRes != '-1' && barcodeScanRes != 'Lỗi khi quét mã.') {
      _showBarcodeDialog(barcodeScanRes);
    }
  }

  // Hàm hiển thị popup với nội dung barcode và nút copy
  Future<void> _showBarcodeDialog(String barcodeContent) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Người dùng phải nhấn nút để đóng
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Mã Vạch Đã Quét'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Nội dung: $barcodeContent'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Copy'),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: barcodeContent));
                Navigator.of(context).pop(); // Đóng dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Đã sao chép vào clipboard!')),
                );
              },
            ),
            TextButton(
              child: const Text('Đóng'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode Scanner'),
      ),
      body: Builder(builder: (BuildContext context) {
        return Container(
          alignment: Alignment.center,
          child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => scanBarcodeNormal(),
                    child: const Text('Bắt đầu quét mã')),
                Text('Kết quả quét: $_scanBarcodeResult\n',
                    style: const TextStyle(fontSize: 20))
              ]),
        );
      }),
    );
  }
}
