import 'package:flutter/material.dart';
import 'personal detail.dart';
import 'company detail.dart';


void main() => runApp(formApp());

class formApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => PersonalDetail(),
        '/Second':(context) => CompanyDetail(),
      },
    );
  }
}

