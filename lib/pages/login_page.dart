import 'dart:convert';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      children: [
        Image.asset(
          'assests/images/welcome.png',
          fit: BoxFit.cover,
        ),
        Text(
          "Create an account",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Padding(
          // to add padding for any of the widget, wrap the widget with the padding mehtod
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Column(
            children: [
              // Textformfield basically creates an inpu field for the user
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Username',
                  labelText: 'Username',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password'),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: TextButton.styleFrom(), // highlights the button text
                onPressed:  () {
                  print('Pressed');
                },
                child: Text('Sign Up'))
            ],
          ),
        )
      ],
    ));
  }
}

//Dont hardcode the styles
// to give spacing use szied box and not padding