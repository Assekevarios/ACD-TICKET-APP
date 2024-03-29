import 'package:event_ticket_checker/views/LoginView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';

final logger = Logger();
final dio = Dio();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
        child: MaterialApp(
      title: 'Event ticket check',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        fontFamily: 'Montserrat',
      ),
      home: const LoginView(),
    ));
  }
}
