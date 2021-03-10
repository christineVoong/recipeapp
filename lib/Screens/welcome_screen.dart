import 'package:flutter/material.dart';
import 'package:recipeapp/Screens/registration_screen.dart';
import 'package:recipeapp/Screens/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  //'static' is a modifier to associate string with class - dont have to create a whole new object to get the id
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(child: Container(
                  padding: EdgeInsets.all(10),
                  //title
                  child: Text(
                    'Welcome to RecipEase',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  )
                )]
            ),
            SizedBox(height: 180.0),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              //login button
              child: Material(
                elevation: 5.0,
                color: Colors.deepOrange[200],
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  //when pressed, user is taken to the login screen
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text('Log In'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              //register button
              child: Material(
                color: Colors.deepOrange[300],
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  //when pressed, user is taken to the registration screen
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text('Register'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
