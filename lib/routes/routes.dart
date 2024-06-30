import 'package:flutter/material.dart';
import 'package:qr_scanner/presentations/screens/homepage.dart';
import 'package:qr_scanner/presentations/screens/qrsgenerate_screen.dart';
import 'package:qr_scanner/presentations/screens/qrcanner_screen.dart';

// Coleccion de rutas de acceso.
Map<String, WidgetBuilder> applicationRoutes() {
  return <String, WidgetBuilder>{
    "/": (BuildContext context) => const HomePage(),
    "scan": (BuildContext context) => const QrCodeScanner(),
    "generate": (BuildContext context) => const QrCodeGenerate()
  };
}
