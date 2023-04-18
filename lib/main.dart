import 'package:attendance_server/provider/server.dart';
import 'package:attendance_server/ui/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

Logger logger =Logger();

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => ServerProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
