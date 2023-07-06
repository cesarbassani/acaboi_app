import 'package:acaboi_app/app/pages/login_page.dart';
import 'package:flutter/material.dart';

class AcaboiApp extends StatelessWidget {
  const AcaboiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      title: 'Acaboi App',
      routes: {
        '/': (context) => LoginPage(),
      },
    );
  }
}
