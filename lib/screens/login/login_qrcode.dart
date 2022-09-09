import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../widgets/ui/qr_scanner_overlay_shape.dart';

class LoginQrCode extends StatefulWidget {
  const LoginQrCode({Key? key}) : super(key: key);

  @override
  _LoginQrCodeState createState() => _LoginQrCodeState();
}

class _LoginQrCodeState extends State<LoginQrCode> {
  MobileScannerController cameraController = MobileScannerController(
    formats: const [BarcodeFormat.qrCode],
    torchEnabled: false,
  );

  Widget _buildTorchBtn(bool isFlashOn) {
    return TextButton.icon(
      style: TextButton.styleFrom(primary: Colors.white),
      label: isFlashOn ? Text('Désactiver le flash') : Text('Activer le flash'),
      icon: isFlashOn
          ? const Icon(Icons.flash_off_rounded)
          : const Icon(Icons.flash_on_rounded),
      onPressed: cameraController.toggleTorch,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final scanArea = min(screenSize.width, screenSize.height) * 0.65;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Scannez votre QRCode'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          MobileScanner(
              allowDuplicates: false,
              controller: cameraController,
              onDetect: (barcode, args) {
                if (barcode.rawValue == null) {
                  debugPrint('Failed to scan Barcode');
                } else {
                  final String code = barcode.rawValue!;
                  debugPrint('Barcode found! $code');
                  cameraController.stop();
                  Navigator.of(context).pop(code);
                }
              }),
          Container(
            decoration: ShapeDecoration(
              shape: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 8,
                cutOutSize: scanArea,
              ),
            ),
          ),
          SafeArea(
            minimum: EdgeInsets.only(bottom: 16.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ValueListenableBuilder(
                valueListenable: cameraController.torchState,
                builder: (context, state, child) {
                  switch (state as TorchState) {
                    case TorchState.off:
                      return _buildTorchBtn(false);
                    case TorchState.on:
                      return _buildTorchBtn(true);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
