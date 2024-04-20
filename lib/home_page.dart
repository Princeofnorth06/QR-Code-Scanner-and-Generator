import 'package:flutter/material.dart';
import 'package:qr_scanner/Scan&Generate/generate.dart';
import 'package:qr_scanner/Scan&Generate/scan.dart';

late Size mq;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Qr Code Scanner & Generator',
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: mq.height * 0.025),
        ),
        centerTitle: true,
        backgroundColor: Colors.red.shade500,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ScanQR()));
                  });
                },
                child: const Text(
                  'Scan QR',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                )),
            SizedBox(
              height: mq.height * 0.1,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const GenterateQR()));
                  });
                },
                child: const Text(
                  'Genterate QR',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                )),
          ],
        ),
      ),
    );
  }
}
