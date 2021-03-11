import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/recipeapp/lib/Overview.dart';
import 'package:recipeapp/Screens/initial_questions.dart';
import 'package:recipeapp/Screens/search_screen.dart';
import 'Screens/welcome_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/registration_screen.dart';
import 'Screens/home_screen.dart';
import 'Screens/upload_screen.dart';
import 'Screens/bookmark_screen.dart';
import 'Screens/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          InitialQuestions.id: (context) => InitialQuestions(),
          Overview.id: (context) => Overview(),
          HomeScreen.id: (context) => HomeScreen(),
          SearchScreen.id: (context) => SearchScreen(),
          UploadScreen.id: (context) => UploadScreen(),
          BookmarkScreen.id: (context) => BookmarkScreen(),
          ProfileScreen.id: (context) => ProfileScreen(),
    }
    );
  }
}

