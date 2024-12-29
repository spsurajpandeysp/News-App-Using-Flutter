import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowAllNews extends StatefulWidget {
  @override
  _ShowAllNewsState createState() => _ShowAllNewsState();
}

class _ShowAllNewsState extends State<ShowAllNews> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ScrollController _scrollController = ScrollController();

  Future<List<Map<String, dynamic>>> fetchNews() async {
    try {
      final snapshot = await _firestore.collection('news').get();
      return snapshot.docs.map((doc) {
        return {
          'id': doc.id,
          'title': doc['heading'],
          'image': "assets/images/image1.jpg",
          'description': doc['desc'],
          'views': doc['views'],
          'likes': doc['likes'],
        };
      }).toList();
    } catch (error) {
      throw Exception("Failed to fetch news: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latest News'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No news available'));
          }

          final newsData = snapshot.data!;

          return ListView.builder(
            controller: _scrollController,
            itemCount: newsData.length,
            itemBuilder: (context, index) {
              final newsItem = newsData[index];
              return NewsCard(
                newsItem: newsItem,
              );
            },
          );
        },
      ),
    );
  }
}

class NewsCard extends StatefulWidget {
  final Map<String, dynamic> newsItem;

  const NewsCard({required this.newsItem});

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
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
                widget.newsItem['image'],
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                widget.newsItem['title'],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                widget.newsItem['description'],
                maxLines: isExpanded ? null : 3,
                overflow: isExpanded
                    ? TextOverflow.visible
                    : TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  isExpanded ? 'Show Less' : '...Read More',
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
                    '${widget.newsItem['views']} views',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    '${widget.newsItem['likes']} Likes',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  IconButton(
                    icon: Icon(Icons.save_alt, color: Colors.blue),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
