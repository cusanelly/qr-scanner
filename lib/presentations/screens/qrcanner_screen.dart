import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class QrCodeScanner extends StatefulWidget {
  const QrCodeScanner({super.key});

  @override
  State<QrCodeScanner> createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  String qrResult = "Scanned data will appear here.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("QR code scanner")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            checkLink(),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: scanQrCode, child: const Text("Scan code"))
          ],
        ),
      ),
    );
  }

  Future<void> scanQrCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "cancel", true, ScanMode.QR);
      if (!mounted) return;
      setState(() {
        qrResult = qrCode.toString();
      });
    } on PlatformException {
      qrResult = "Fail to read QR code.";
    }
  }

  Widget checkLink() {
    InkWell urlWidget;
    if (qrResult.startsWith("https") || qrResult.startsWith("https")) {
      urlWidget = InkWell(
        onTap: () => launchUrl(Uri.parse(qrResult)),
        child: Text(qrResult, style: const TextStyle(color: Colors.blueAccent)),
      );
    } else {
      urlWidget = InkWell(
        child: Text(
          qrResult,
          style: const TextStyle(color: Colors.black),
        ),
      );
    }

    return urlWidget;
  }
}
