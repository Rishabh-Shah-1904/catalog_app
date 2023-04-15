import 'dart:convert';

import 'package:catalog_app/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => //Used to create a stateful widget
      _LoginPageState(); // _ in the variable name ,makes the variabler private
}

class _LoginPageState extends State<LoginPage> {
  // State class extends the stateful widget
  String name = "";
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      //Makes the design responsive and helps remove the bottom overflow error
      child: Column(
        children: [
          Image.asset(
            'assests/images/welcome.png',
            fit: BoxFit.cover,
            height: 300,
          ),
          Text(
            "Welcome $name", // Adding the name after entering
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
                  onChanged: (value) {
                    // Onchanged lets us control the input of the textformfield
                    name = value; // taking the input from the user
                    setState(
                        () {}); // Renders the UI again by calling the build function;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                ),
                SizedBox(
                  height: 40,
                ),
                InkWell( //Inkwell can add widgets
                  onTap: () async { // Await function will work only if we call the async modifier
                    setState(() {
                      changeButton = true; //Changing the state of the button
                    });

                    await Future.delayed(Duration(seconds:2)); // waits or stops the program for the mentioned duration
                    Navigator.pushNamed(context, myRoutes.homeRoute); //Navigator logic
                  },
                  child: AnimatedContainer( //Gesture effect doesnt give a effectk, Inkwell gives an effect
                    duration: Duration(milliseconds: 500), // time for animation is 1s
                    width: changeButton ? 50 :  150,
                    height: 50,
                    alignment: Alignment
                        .center, // Centers the text or anything in the container
                    child: changeButton ? Icon(Icons.done,color: Colors.white) : Text( //Adding the done icon
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: changeButton ? Colors.lightGreen :  Colors.amber,
                      borderRadius: BorderRadius.circular(changeButton ? 50:10)
                    ),
                  ),
                ) // A box
                // ElevatedButton(
                //   style: TextButton.styleFrom(
                //       minimumSize: Size(100, 40)), // highlights the button text
                //   onPressed: () {
                //     Navigator.pushNamed(context, myRoutes.homeRoute);
                //   },
                //   child: Text('Sign Up'),
                // )
              ],
            ),
          )
        ],
      ),
    ));
  }
}

//Dont hardcode the styles
// to give spacing use szied box and not padding
// state is a thing that can have change
// Stateless cannot have a change in state and stateful can have real time rendering
// Widgets can maintain their own states 