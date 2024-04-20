import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_scanner/home_page.dart';

class ScanQR extends StatefulWidget {
  const ScanQR({super.key});

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  String qrResult = 'Scanned Data will be Appered here.';

  Future<void> scan() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#800080', 'Cancel', true, ScanMode.QR);
      if (!mounted) return;
      setState(() {
        qrResult = qrCode.toString();
      });
    } on PlatformException {
      qrResult = 'Fail to fetch QR code.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Scan QR Code',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.red.shade500,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: mq.height * 0.01, horizontal: mq.width * 0.02),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  qrResult,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: mq.height * 0.05,
            ),
            ElevatedButton(
                onPressed: scan,
                child: const Text(
                  'Scan Qr',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ))
          ],
        ),
      ),
    );
  }
}
