import 'package:event_ticket_checker/models/ticket.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CheckResult extends StatefulWidget {
  const CheckResult({super.key});

  @override
  State<CheckResult> createState() => _CheckResultState();
}

class _CheckResultState extends State<CheckResult> {
  Ticket ticket = Ticket(
    code: '123456789',
    userName: 'Random user',
    userPhone: '+2250102030405',
  );

  final gifts = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ticket details',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            ListTile(
              title: Text(ticket.code),
            ),
            ListTile(
              title: Text(ticket.userName),
            ),
            ListTile(
              title: Text(ticket.userPhone),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                'Gifts',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            for (int gift in gifts)
              CheckboxListTile(
                  title: Text('Some random gift'),
                  value: gift.isEven,
                  onChanged: (val) {})
          ],
        ),
      ),
    );
  }
}
