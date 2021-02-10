import 'package:flutter/material.dart';

class BookmarkScreen extends StatefulWidget {
  static String id = 'bookmark_screen';

  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[300],
        title: const Text('Bookmark'),
      ),
      body: Center(child: Text('Bookmark')),
    );
  }
}
