import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeGenerate extends StatefulWidget {
  const QrCodeGenerate({super.key});

  @override
  State<QrCodeGenerate> createState() => _QrCodeGenerateState();
}

class _QrCodeGenerateState extends State<QrCodeGenerate> {
  TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Generate QR code.")),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (urlController.text.isNotEmpty)
                  QrImageView(data: urlController.text, size: 200),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    controller: urlController,
                    decoration: InputDecoration(
                        hintText: "Enter your data",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        labelText: "Enter your data"),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: const Text("Generate QR code"))
              ],
            ),
          ),
        ));
  }

  Future<void> generateQrCode() async {
    try {} on PlatformException {}
  }
}
