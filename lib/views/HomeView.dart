import 'dart:async';

import 'package:event_ticket_checker/views/TicketCheckView.dart';
import 'package:event_ticket_checker/widgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:loader_overlay/loader_overlay.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _scanBarcode = 'Unknown';
  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (barcodeScanRes.isEmpty || barcodeScanRes == '-1') {
        return;
      } else {
        if (!mounted) return;
        context.loaderOverlay.show();
        Future.delayed(const Duration(seconds: 1), () {
          context.loaderOverlay.hide();
        }).then((value) {
          showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  content: Text('The ticket is valid'),
                );
              });
        });
      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _scanBarcode = barcodeScanRes;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Ticket check app',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              title: 'Enter a ticket number',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TicketCheckView(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Or',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 16,
            ),
            CustomButton(
              title: 'Scan a qr code',
              onPressed: () {
                scanQR();
              },
            ),
            Text(_scanBarcode)
          ],
        ),
      ),
    );
  }
}
