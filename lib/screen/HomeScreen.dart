import 'package:flutter/material.dart';
import 'package:news/res/consts/consts.dart';
import 'package:news/screen/AddNewsScreen.dart';
import 'package:news/screen/SavedNewsScreen.dart';
import 'package:news/screen/ShowAllNews.dart';
import 'package:news/screen/YourNewsScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int myIndex = 0;

  List<Widget> widgetList = [
    ShowAllNews(),
    AddNewsscreen(),
    YourNewsscreen(),
    SavedNewsscreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
        backgroundColor: Color(0xFF0E86D4),
      ),
      backgroundColor: Colors.white,
      body:Center(child: widgetList[myIndex],) ,
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            onTap: (index) {
              setState(() {
                myIndex = index;
              });
            },
            backgroundColor: Color(0xFF0E86D4),
            currentIndex: myIndex,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.white,

            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "News",
            
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: "Add",
              
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.save),
                label: "Saved",
            
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Your",
         
              ),
            ],
          ),
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (int i = 0; i < 4; i++)
                  if( i!=0)...[
                  
                  Container(
                    width: 1,
                    height: double.infinity,
                    color: Colors.white,
                  ),
                  Expanded(child: SizedBox()),
                ]

                else ...[
                  Container(
                    width: 0,
                    height: double.infinity,
                    color: Color(0xFF0E86D4),
                  ),
                  Expanded(child: SizedBox()),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
