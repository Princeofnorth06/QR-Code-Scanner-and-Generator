import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_scanner/home_page.dart';

class GenterateQR extends StatefulWidget {
  const GenterateQR({super.key});

  @override
  State<GenterateQR> createState() => _GenterateQRState();
}

class _GenterateQRState extends State<GenterateQR> {
  TextEditingController urlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate QR Code'),
        backgroundColor: Colors.red.shade500,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (urlController.text.isNotEmpty)
                  QrImageView(
                    data: urlController.text,
                    size: 200,
                    padding: EdgeInsets.only(
                        bottom: mq.height * 0.05, left: mq.width * 0.03),
                  ),
                Container(
                  padding: EdgeInsets.only(
                      left: mq.width * 0.2, right: mq.width * 0.2),
                  child: TextField(
                    maxLines: null,
                    controller: urlController,
                    decoration: InputDecoration(
                        hintText: "Enter Your Data",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        labelText: 'Enter Your Data'),
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.02,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: const Text('Generate QR')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
