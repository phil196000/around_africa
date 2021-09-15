import 'dart:developer';
import 'dart:io';
import 'package:around_africa/customised_widgets/buttons/textbutton.dart';
import 'package:around_africa/customised_widgets/texts/blacktext.dart';
import 'package:around_africa/main.dart';
import 'package:around_africa/navigation/appbar.dart';
import 'package:around_africa/navigation/drawer.dart';
import 'package:around_africa/redux/appstate.dart';
import 'package:around_africa/screens/details/details.dart';
import 'package:around_africa/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:around_africa/navigation/bottomButtons.dart';
import 'package:http/http.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:redux/redux.dart';

class QrCode extends StatefulWidget {
  const QrCode({Key? key}) : super(key: key);

  @override
  _QrCodeState createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: CustomDrawer(),
      appBar: CustomAppBar(
        context: context,
        onPressed: (BuildContext context) {
          log('Custom App bar pressed');
          Scaffold.of(context).openDrawer();
        },
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: _buildQrView(context),
            ),
          ),
          Spacer(
            flex: 2,
          )
        ],
      ),
      persistentFooterButtons: [
        BottomButtons(
          emailPressed: () {},
          phonePressed: () {},
        )
      ],
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) async {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        result = scanData;
      });
      if (scanData.code.length > 0) {
        getIt.get<Store<AppState>>().state.spots.forEach((element) async {
          if (element.id!.toLowerCase().contains(scanData.code.toLowerCase())) {
            await controller.pauseCamera();
            await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                    title: Container(
                      alignment: Alignment.center,
                      child: BlackText(
                        text: 'Tourist Site Found',
                      ),
                    ),
                    content: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text.rich(TextSpan(text: 'Name: ', children: [
                            TextSpan(
                                text: element.name.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: CustomColors.primary))
                          ])),
                          Container(
                            child: BlackText(
                              weight: FontWeight.normal,
                              text:
                                  'Click on Proceed to view more details about it',
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: ButtonText(
                                  text: "CANCEL",
                                  color: Colors.red,
                                  onPressed: () async {
                                    Navigator.pop(context);
                                    controller.resumeCamera();
                                  },
                                ),
                              ),
                              Spacer(),
                              Expanded(
                                flex: 2,
                                child: ButtonText(
                                  text: "PROCEED",
                                  backgroundColor: CustomColors.secondary,
                                  color: CustomColors.white,
                                  onPressed: () async {
                                    await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Details(spot: element),
                                        ));
                                    Navigator.pop(context);
                                    controller.resumeCamera();
                                  },
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ));
              },
            );
          }
        });
      }

      log(scanData.code.toString());
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
