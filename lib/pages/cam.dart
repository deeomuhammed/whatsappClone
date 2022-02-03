import 'package:flutter/material.dart';

// ignore: camel_case_types
class cam extends StatefulWidget {
  const cam({Key? key}) : super(key: key);

  @override
  _camState createState() => _camState();
}

// ignore: camel_case_types
class _camState extends State<cam> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Tab(
        icon: Icon(
          Icons.camera_alt,
          size: 100,
          color: Colors.white,
        ),
      ),
      color: Colors.amber,
    );
  }
}
