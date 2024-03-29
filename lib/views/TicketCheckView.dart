import 'package:event_ticket_checker/views/CheckResultView.dart';
import 'package:event_ticket_checker/widgets/CustomButton.dart';
import 'package:event_ticket_checker/widgets/CustomTextField.dart';

import 'package:flutter/material.dart';

import 'package:loader_overlay/loader_overlay.dart';

class TicketCheckView extends StatefulWidget {
  const TicketCheckView({super.key});

  @override
  State<TicketCheckView> createState() => _TicketCheckViewState();
}

class _TicketCheckViewState extends State<TicketCheckView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Check ticket',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(
              textEditingController: TextEditingController(),
              hintText: 'ticket number',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              title: 'Check',
              onPressed: () async {
                context.loaderOverlay.show();
                Future.delayed(const Duration(seconds: 1), () {
                  context.loaderOverlay.hide();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckResult(),
                    ),
                  );
                });
                // .then(
                //   (value) {
                //     showDialog(
                //       context: context,
                //       builder: (context) {
                //         return const AlertDialog(
                //           content: Text('The ticket is valid'),
                //         );
                //       },
                //     );
                //   },
                // );
              },
            ),
            const SizedBox(
              height: kToolbarHeight,
            )
          ],
        ),
      ),
    );
  }
}
