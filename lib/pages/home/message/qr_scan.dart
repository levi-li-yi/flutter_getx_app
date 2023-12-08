/*
 * @Author: Levi Li
 * @Date: 2023-12-06 15:26:57
 * @description: 
 */
import 'package:flutter/material.dart';
import 'package:scan/scan.dart';

class QrScan extends StatefulWidget {
  const QrScan({Key? key}) : super(key: key);

  @override
  State<QrScan> createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  ScanController controller = ScanController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('扫一扫')),
      body: ScanView(
        controller: controller,
        onCapture: (data) {
          print('scan data: $data');
        },
      ),
    );
  }
}
