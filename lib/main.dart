import 'package:flutter/material.dart';
import 'UI/personal detail.dart';
import 'UI/company detail.dart';
import 'UI/confirm registration.dart';

void main() => runApp(formApp());


class formApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.person)),
                Tab(icon: Icon(Icons.business_center_sharp)),
                Tab(icon: Icon(Icons.settings)),
              ],
            ),
            title: const Text('Registration Form',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white70),),
            backgroundColor: primaryColor,
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              PersonalDetail(),
              CompanyDetail(),
              ConfirmRegistration(),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
