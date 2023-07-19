import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intern_task/views/checkout_page.dart';
import 'package:intern_task/views/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      // home: const CheckOutPage(),
    );
  }
}
