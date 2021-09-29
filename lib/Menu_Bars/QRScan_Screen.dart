import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';

class QRScanPage extends StatelessWidget {
  const QRScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage (
                      image: AssetImage('assets/LPL_logo.png'),
                      fit: BoxFit.contain,
                    )
                )
            ),
            Container(
              color: Color.fromRGBO(255,255,255,0.7),
            ),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(240, 80),
                    primary: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => QRViewExample(),
                  )
                  );
                },
                child: Text('qrView'),
              ),
            ),
          ],
        )
    );
  }
}

class QRViewExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? barcode;
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();

    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          buildQrView(context),
          Positioned(bottom: 10, child: buildResult()),
          Positioned(top: 10, child: buildControlButtons()),
        ],
      ),
    ),
  );

  Widget buildControlButtons() => Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.white24,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: FutureBuilder<bool?>(
            future: controller?.getFlashStatus(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return Icon(
                    snapshot.data! ? Icons.flash_on : Icons.flash_off);
              } else {
                return Container();
              }
            },
          ),
          onPressed: () async {
            await controller?.toggleFlash();
            setState(() {});
          },
        ),
        IconButton(
          icon: FutureBuilder(
            future: controller?.getCameraInfo(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return Icon(Icons.switch_camera);
              } else {
                return Container();
              }
            },
          ),
          onPressed: () async {
            await controller?.flipCamera();
            setState(() {});
          },
        ),
      ],
    ),
  );

  Widget buildResult() => Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.white24,
    ),
    child: Text(
      barcode != null ? 'Result : ${barcode!.code}' : 'Scan a code!',
      maxLines: 3,
    ),
  );

  Widget buildQrView(BuildContext context) => QRView(
    key: qrKey,
    onQRViewCreated: onQRViewCreated,
    overlay: QrScannerOverlayShape(
      borderColor: Theme.of(context).accentColor,
      borderRadius: 10,
      borderLength: 20,
      borderWidth: 10,
      cutOutSize: MediaQuery.of(context).size.width * 0.8,
    ),
  );

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);

    controller.scannedDataStream
        .listen((barcode) => setState(() => this.barcode = barcode));
  }
}

