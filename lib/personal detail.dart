import 'package:flutter/material.dart';

const primaryColor = Color(0xff269ac5);
const secondaryColor = Color(0xFF707070);

class personalDetail extends StatefulWidget {
  @override
  State<personalDetail> createState() => _personalDetailState();
}

class _personalDetailState extends State<personalDetail> {
  var _myFormKey = GlobalKey<FormState>();
  TextEditingController _dobController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dobController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Page'),
        backgroundColor: primaryColor,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _myFormKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    icon: const Icon(Icons.person),
                    labelText: 'Name',
                    hintText: 'Enter your full name',
                    labelStyle: TextStyle(color: secondaryColor),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: secondaryColor),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.email),
                    labelText: 'Email',
                    hintText: 'Enter your email address',
                    labelStyle: TextStyle(color: secondaryColor),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: secondaryColor),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your mobile number';
                    }
                    if (value.length < 10) {
                      return 'Please enter a valid phone number';
                    }
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.phone),
                    labelText: 'Mobile Number',
                    labelStyle: TextStyle(color: secondaryColor),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: secondaryColor),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _dobController,
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  decoration: InputDecoration(
                    icon: const Icon(Icons.calendar_today),
                    labelText: 'DOB',
                    hintText: 'Select your date of birth',
                    labelStyle: TextStyle(color: secondaryColor),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: secondaryColor),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _myFormKey.currentState?.validate();
                    Navigator.pushNamed(context, '/Second');
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(
                        color: secondaryColor, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
