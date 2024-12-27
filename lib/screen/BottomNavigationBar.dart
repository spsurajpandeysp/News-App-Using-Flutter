import 'package:flutter/material.dart';

class Bottomnavigationbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.blue,
      child: Padding(padding: EdgeInsets.all(10),child: Row(
        children: [Icon(Icons.home)],
      ),),
    );
  }
}
