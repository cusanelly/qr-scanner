import 'package:flutter/material.dart';
import 'package:qr_scanner/presentations/screens/qrsgenerate_screen.dart';
import 'package:qr_scanner/presentations/screens/qrcanner_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("QR Code Scanner - Generator.")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const QrCodeScanner()));
                  // Navigator.pop(context);
                });
              },
              child: const Text("Scan QR Code."),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const QrCodeGenerate()));
                });
              },
              child: const Text("Generate QR Code."),
            )
          ],
        ),
      ),
    );
  }
}
