import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'recipe_screen.dart';
import '../Functions/DataController.dart';

class SearchScreen extends StatefulWidget {
  static String id = 'search_screen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  QuerySnapshot snapshotData;
  bool isSearched = false;

  @override
  Widget build(BuildContext context) {

    Widget searchedData(){
      return ListView.builder(
          itemCount: snapshotData.docs.length,
          itemBuilder: (context, index){
            return Card(
              child: ListTile(
                onTap: (){
                  Get.to(RecipeScreen(),
                    transition: Transition.downToUp,
                    arguments: snapshotData.docs[index],
                  );
                },
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    snapshotData.docs[index].data()['image']
                  ),
                ),
                title: Text(snapshotData.docs[index].data()['name']),
                subtitle: Text(snapshotData.docs[index].data()['creator']),
              ),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[300],
        actions: <Widget>[
          GetBuilder<DataController>(
              init: DataController(),
              builder: (value){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.clear), onPressed: (){
                    setState(() {
                      isSearched = false;
                    });
                  }),
                );
              }
          ),
          GetBuilder<DataController>(
              init: DataController(),
              builder: (value){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.search), onPressed: (){
                    value.queryData(searchController.text).then((value){
                      snapshotData = value;
                      setState(() {
                        isSearched = true;
                      });
                    });
                  }),
                );
              }
          ),
        ],
        title: TextField(decoration: InputDecoration(
            hintText: 'Search'),
          controller: searchController,
        ),
      ),
      body: isSearched ? searchedData() : Container(
        child: Center(
          child: Text("Search Recipes")
        )
      ),
    );
  }
}
