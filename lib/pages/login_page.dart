import 'dart:convert';

import 'package:catalog_app/utils/routes.dart';
import 'package:flutter/material.dart';


// Creating the login page class
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => //Used to create a stateful widget
      _LoginPageState(); // _ in the variable name ,makes the variabler private
}

//------------------------------------------------------------------------------------------

class _LoginPageState extends State<LoginPage> {
  // State class extends the stateful widget
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<
      FormState>(); // Global key allows the key to be accessed anywhere and the type of the global key is formstate


//------------------------------------------------------------------------------------------

// Method to move to the home page
  moveToHome(BuildContext) async {
    if(_formKey.currentState!.validate()){ // Gets the current state of the form key to validate the formkey
    // Await function will work only if we call the async modifier
    setState(() {
      changeButton = true; //Changing the state of the button
    });

    await Future.delayed(Duration(
        seconds: 2)); // waits or stops the program for the mentioned duration
    await Navigator.pushNamed(context, myRoutes.homeRoute); //Navigator logic

    setState(() {
      changeButton = false;
    });}
  }

  //------------------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView( //Makes the design responsive and helps remove the bottom overflow error

//------------------------------------------------------------------------------------------      

      // wraps up the entire page elements 
      child: Column(
        children: [
          // Adding the Images
          Image.asset(
            'assests/images/welcome.png',
            fit: BoxFit.cover,
            height: 300,
          ),

//------------------------------------------------------------------------------------------

          //Welcome Text
          Text(
            "Welcome $name", // Adding the name after entering
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w300,
            ),
          ),

//------------------------------------------------------------------------------------------

          //Sized box to create a seperation
          SizedBox(
            height: 30.0,
          ),
          Padding(
            // to add padding for any of the widget, wrap the widget with the padding mehtod
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),

//------------------------------------------------------------------------------------------

            // Form elements such as username and password
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                 
//------------------------------------------------------------------------------------------

                 // Form for username
                  TextFormField(  // Textformfield basically creates an inpu field for the user
                    validator: (value){
                      if(value!.isEmpty){ // Adding a null check is important the semicolon is the null check over here
                        return 'Username cannot be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Username',
                      labelText: 'Username',
                    ),

//------------------------------------------------------------------------------------------

                    // creating the name after welcome
                    onChanged: (value) {
                      // Onchanged lets us control the input of the textformfield
                      name = value; // taking the input from the user
                      setState(
                          () {}); // Renders the UI again by calling the build function;
                    },
                  ),

//------------------------------------------------------------------------------------------

                  // Form for password
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                     validator: (value){
                      if(value!.isEmpty){ // Adding a null check is important the semicolon is the null check over here
                        return 'Password cannot be empty';
                      }
                      else if(value.length < 6){
                        return 'Passwrod has to be atleast 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),

//------------------------------------------------------------------------------------------

                  // Wrapping with inkwell for adding ripple effects and splash colors
                  InkWell(
                    //Inkwell can add widgets
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      //Gesture effect doesnt give a effectk, Inkwell gives an effect
                      duration: Duration(
                          milliseconds: 500), // time for animation is 1s
                      width: changeButton ? 50 : 150,
                      height: 50,
                      alignment: Alignment
                          .center, // Centers the text or anything in the container

//------------------------------------------------------------------------------------------

                      // Creating the done icon
                      child: changeButton
                          ? Icon(Icons.done, color: Colors.white)
                          : Text(
                              //Adding the done icon
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),

//------------------------------------------------------------------------------------------

                      // Rounding the border of the button
                      decoration: BoxDecoration(
                          color:
                              changeButton ? Colors.lightGreen : Colors.black87,
                          borderRadius:
                              BorderRadius.circular(changeButton ? 50 : 10)),
                    ),
                  ) 
                ],
              ),
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