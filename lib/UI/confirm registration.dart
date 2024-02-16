import 'package:flutter/material.dart';

class ConfirmRegistration extends StatefulWidget {
  @override
  _ConfirmRegistrationState createState() => _ConfirmRegistrationState();
}

class _ConfirmRegistrationState extends State<ConfirmRegistration> {
  bool isConfirmed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Confirm Registration',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            Row(
              children: [
                Checkbox(
                  value: isConfirmed,
                  onChanged: (value) {
                    setState(() {
                      isConfirmed = value!;
                    });
                  },
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    'I confirm that all the information provided is accurate and true.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: isConfirmed ? _handleSubmitButton : null,
              child: Text('Submit Registration'),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitButton() {
    // Implement the logic for handling the submit button click
    // This could include navigating to a new screen, showing a dialog, etc.
    print('Submit button clicked.');

    // Show a success dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                Icons.check,
                color: Colors.green,
              ),
              SizedBox(width: 10),
              Text('Success'),
            ],
          ),
          content: Text('Your registration is successful.'),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog and perform any additional actions if needed
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
