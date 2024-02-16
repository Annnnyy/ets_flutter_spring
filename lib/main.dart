import 'package:flutter/material.dart';
import 'personal detail.dart';
import 'company detail.dart';

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
            title: const Text('Registration Form'),
            backgroundColor: primaryColor,
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              PersonalDetail(),
              CompanyDetail(),
              Container(child: Icon(Icons.settings)),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
