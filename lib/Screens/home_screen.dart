import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/recipeapp/lib/Functions/DataController.dart';
import 'package:recipeapp/Screens/recipe_screen.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[300],
        title: const Text('RecipEase'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Text("Check this out!"),
            SizedBox(height: 8),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(height: 150,
                    child: GetBuilder<DataController>(
                      init: DataController(),
                      builder: (value) {
                        return FutureBuilder(
                            future: value.getRandom('RecipeInfo'),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Center(child: CircularProgressIndicator());
                              }
                              else {
                                return new ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: (){
                                        Get.to(RecipeScreen(),
                                          transition: Transition.downToUp,
                                          arguments: snapshot.data[index],
                                        );
                                      },
                                      child: Container(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                            child: Padding(padding: const EdgeInsets.symmetric(horizontal: 5),
                                              child: Container(width: 150,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(snapshot.data[index].data()['image'])
                                                    )),
                                              ),),),
                                              Padding(padding: const EdgeInsets.all(5.0),
                                            child: Container(
                                                constraints: BoxConstraints(maxWidth: 100),
                                                child: Text(snapshot.data[index].data()['name'])),),
                                        ],)
                                      ),
                                    );},
                                );}
                            });
                      }),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.black,
              height: 20,
              thickness: 2,),
            Text("Breakfast"),
            SizedBox(height: 8),
            Container(height: 150,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(child: GetBuilder<DataController>(
                      init: DataController(),
                      builder: (value) {
                        return FutureBuilder(
                            future: value.getBreakfast('RecipeInfo'),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Center(child: CircularProgressIndicator());
                              } else {
                                return new ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: (){
                                        Get.to(RecipeScreen(),
                                          transition: Transition.downToUp,
                                          arguments: snapshot.data[index],
                                        );
                                      },
                                      child: Container(child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Padding(padding: const EdgeInsets.symmetric(horizontal: 5),
                                                  child: Container(width: 150,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: NetworkImage(snapshot.data[index].data()['image'])
                                                        )),
                                                  ),),),
                                              Padding(padding: const EdgeInsets.all(5.0),
                                                child: Container(
                                                    constraints: BoxConstraints(maxWidth: 100),
                                                    child: Text(snapshot.data[index].data()['name'])),),
                                            ],)
                                      ),
                                    );},
                                );}
                            });
                      }),
                  ),],
              ),),
            const Divider(
              color: Colors.black,
              height: 20,
              thickness: 2,),
            Text("Lunch",),
            SizedBox(height: 8),
            Container(height: 150,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(child: GetBuilder<DataController>(
                      init: DataController(),
                      builder: (value) {
                        return FutureBuilder(
                            future: value.getLunch('RecipeInfo'),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Center(child: CircularProgressIndicator());
                              } else {
                                return new ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: (){
                                        Get.to(RecipeScreen(),
                                          transition: Transition.downToUp,
                                          arguments: snapshot.data[index],
                                        );
                                      },
                                      child: Container(child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Padding(padding: const EdgeInsets.symmetric(horizontal: 5),
                                                  child: Container(width: 150,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: NetworkImage(snapshot.data[index].data()['image']))),),
                                                ),),
                                              Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: Container(
                                                    constraints: BoxConstraints(maxWidth: 100),
                                                    child: Text(snapshot.data[index].data()['name'])),
                                              ),],
                                          )),
                                    );
                                  },);
                              }}
                        );}
                  ),),
                ],),
            ),
            const Divider(
              color: Colors.black,
              height: 20,
              thickness: 2,),
            Text("Dinner"),
            SizedBox(height: 8),
            Container(height: 150,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(child: GetBuilder<DataController>(
                      init: DataController(),
                      builder: (value) {
                        return FutureBuilder(
                            future: value.getDinner('RecipeInfo'),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Center(child: CircularProgressIndicator());
                              } else {
                                return new ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: (){
                                        Get.to(RecipeScreen(),
                                          transition: Transition.downToUp,
                                          arguments: snapshot.data[index],
                                        );
                                      },
                                      child: Container(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Padding(padding: const EdgeInsets.symmetric(horizontal: 5),
                                                  child: Container(width: 150,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: NetworkImage(snapshot.data[index].data()['image']))),),
                                                ),),
                                              Padding(padding: const EdgeInsets.all(5.0),
                                                child: Container(constraints: BoxConstraints(maxWidth: 100),
                                                    child: Text(snapshot.data[index].data()['name'])),),
                                            ],)
                                      ),
                                    );},
                                );}
                            });
                      }),
                  ),],
              ),),
          ],),
      ),);
  }
}