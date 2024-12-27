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
  @override
  List<Widget> widgetList = [
    ShowAllnews(),
    AddNewsscreen(),
    YourNewsscreen(),
    SavedNewsscreen()
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore Newss"),
      ),
      body: widgetList[myIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => {
            setState(() {
              myIndex = index;
            })
          },
          currentIndex: myIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "All News"),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Add News",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Saved News"),
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Your Added News")
          ]),
    );
  }
}
