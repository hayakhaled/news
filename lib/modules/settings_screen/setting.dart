import 'package:flutter/material.dart';

class SettingsScreen  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Setting Screen' ,
        style:TextStyle(
          fontSize: 20.0,
          fontWeight:FontWeight.bold,
        ),
      ),
    );
  }
}