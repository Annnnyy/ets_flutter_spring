import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';

const primaryColor = Color(0xFF26A69A);
const secondaryColor = Color(0xFF707070);

class PersonalDetail extends StatefulWidget {
  @override
  State<PersonalDetail> createState() => _PersonalDetailState();
}

class _PersonalDetailState extends State<PersonalDetail> with AutomaticKeepAliveClientMixin {
  final _myFormKey = GlobalKey<FormState>();
  TextEditingController _dobController = TextEditingController();
  DateTime? _selectedDate;

  @override
  bool get wantKeepAlive => true;

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
    super.build(context);
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(0, 10 , 0, 0),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
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
                      prefixIcon: const Icon(Icons.person),
                      prefixIconColor: primaryColor,
                      labelText: 'Name',
                      hintText: 'Enter your full name',
                      labelStyle: const TextStyle(
                          color: secondaryColor, fontWeight: FontWeight.bold),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: secondaryColor),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email address';
                      }
                      return EmailValidator.validate(value) ? null : 'Please enter a valid email';
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      prefixIconColor: primaryColor,
                      labelText: 'Email',
                      hintText: 'Enter your email address',
                      labelStyle: const TextStyle(
                          color: secondaryColor, fontWeight: FontWeight.bold),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: secondaryColor),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your mobile number';
                      }
                      if (value.length != 10 ) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone),
                      prefixIconColor: primaryColor,
                      labelText: 'Mobile Number',
                      labelStyle: const TextStyle(color: secondaryColor, fontWeight: FontWeight.bold),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: secondaryColor),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _dobController,
                    readOnly: true,
                    onTap: () => _selectDate(context),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.calendar_today),
                      prefixIconColor: primaryColor,
                      labelText: 'DOB',
                      hintText: 'Select your date of birth',
                      labelStyle: const TextStyle(
                          color: secondaryColor, fontWeight: FontWeight.bold),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: secondaryColor),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_myFormKey.currentState?.validate() == true) {
                        DefaultTabController.of(context).animateTo(1);
                            }
                    },
                    child: const Text(
                      'Next',
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
