import 'package:finalcontact/Constant/cachHelper.dart';
import 'package:finalcontact/view/screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Contact App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
