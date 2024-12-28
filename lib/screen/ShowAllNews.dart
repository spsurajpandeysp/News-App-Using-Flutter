import 'package:flutter/material.dart';

class ShowAllnews extends StatefulWidget {
  @override
  _ShowAllnewsState createState() => _ShowAllnewsState();
}

class _ShowAllnewsState extends State<ShowAllnews> {
  // Simulating a list of news with view count, like count, and other details
  final List<Map<String, dynamic>> newsData = List.generate(20, (index) {
    return {
      'title': 'News Headings ${index + 1}',
      'image': 'assets/images/image1.jpg', // Replace with actual image path
      'description':
          'This is a short description of the news item.sdfsdfffff sdfffffffffffffff sdffffffffffffffffff dsfffffffffffffffffff Here is a detailed description of the news content. This part will be shown when you click on Read More.',
      'views': 120 + index * 10,
      'likes': 50 + index,
      'isExpanded': false, // Track whether the description is expanded
    };
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: newsData.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 10, 
            shadowColor: Colors.black,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
               
                    Image.asset(
                      newsData[index]['image'],
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    Text(
                      newsData[index]['title'],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
          
                    Text(
                      newsData[index]['description'],
                      maxLines: newsData[index]['isExpanded'] ? null : 3,
                      overflow: newsData[index]['isExpanded']
                          ? TextOverflow.visible
                          : TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    SizedBox(height: 10),
               
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          newsData[index]['isExpanded'] =
                              !newsData[index]['isExpanded'];
                        });
                      },
                      child: Text(
                        newsData[index]['isExpanded'] ? 'Show Less' : '...Read More',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.remove_red_eye, size: 16, color: Colors.grey),
                        SizedBox(width: 5),
                        Text(
                          '${newsData[index]['views']} views',
                          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                        Spacer(),
        
                        IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          onPressed: () {
                      
                          },
                        ),
                        Text(
                          '${newsData[index]['likes']} Likes',
                          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
            
                        IconButton(
                          icon: Icon(Icons.save_alt, color: Colors.blue),
                          onPressed: () {
                          
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
