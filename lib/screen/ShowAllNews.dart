import 'package:flutter/material.dart';

class ShowAllnews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(
              child: Container(
                  width: 385,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Text("Heading",
                            style: TextStyle(
                              fontSize: 20,
                            )),
                        Image(image: AssetImage('assets/images/image1.jpg')),
                        Text("Paragraph")
                      ],
                    ),
                  )))
        ],
      ),
      color: Colors.amber,
      width: MediaQuery.of(context).size.width,
    );
  }
}
