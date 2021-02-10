import 'package:flutter/material.dart';

class UploadScreen extends StatefulWidget {
  static String id = 'upload_screen';

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[300],
        title: const Text('Upload'),
      ),
      body: Center(child: Text('Upload')),
    );
  }
}
