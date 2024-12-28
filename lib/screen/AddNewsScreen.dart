import 'package:flutter/material.dart';

class AddNewsscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(children: [
        Container(child:TextField(), width: 300,),
        Container(child:TextField(), width: 300,),
        Container(child:TextField(), width: 300,),
      ],),
    );
  }
}
