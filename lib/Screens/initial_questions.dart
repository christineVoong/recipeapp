import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Overview.dart';

class InitialQuestions extends StatefulWidget {
  //modifier to associate string with class - dont have to create a whole new object to get the id
  static String id = 'initial_questions';

  @override
  _InitialQuestionsState createState() => _InitialQuestionsState();
}

class _InitialQuestionsState extends State<InitialQuestions> {

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  String email;
  String password;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser()  {
    try {
      final user =  _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  String restrictionChoose;
  List restriction = [
    "Vegan", "Vegetarian", "None"
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Before we begin',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                Flexible(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'What describes your diet?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    )),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: DropdownButton(
                      hint: Text('Select: '),
                      //dropdownColor: Colors.deepOrange[300],
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 35,
                      value: restrictionChoose,
                      onChanged: (newValue){
                        setState(() {
                          restrictionChoose = newValue;
                        });
                      },
                      items: restriction.map((valueItem){
                        return  DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {

                    _firestore.collection('Users').add({
                      'email': loggedInUser.email,
                      'restriction': restrictionChoose,
                      'username': null,
                    })
                    ;

                    try{
                      final user = _auth.currentUser;
                      if (user!=null) {
                        Navigator.pushNamed(context, Overview.id);
                      }
                    } catch(e) {
                      print(e);
                    }
                  },
                  child: Text('Submit'),

                )
              ],
          ),
        ),
  );


  }
