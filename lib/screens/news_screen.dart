import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int newsNo = 0;
  List<News> _list = new List<News>();

  Future<List<News>> fetchNews() async {
    final response = await http.get(
        'http://newsapi.org/v2/top-headlines?country=in&apiKey=5d415c5875274ba18697549dc9de2637');
    Map map = json.decode(response.body);
    for (int i = 0; i < map['articles'].length; i++) {
      if (map['articles'][i]['author'] != null) {
        _list.add(new News.fromJson(map['articles'][i]));
      }
    }

    return _list;
  }

  @override
  void initState() {
    fetchNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: FutureBuilder(
        future: fetchNews(),
        builder: (BuildContext context, AsyncSnapshot<List<News>> snapshot) {
          if (snapshot.hasData) {
            return new Dismissible(
              key: Key(newsNo.toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  newsNo = (newsNo + 1) % (_list.length);
                });
              },
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(0xFFEDEAF8),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            child: AutoSizeText(
                              '${snapshot.data[newsNo].title}',
                              style: TextStyle(
                                  color: Color(0xFF5855BD), fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20, top: 10),
                            child: Image.network(
                              snapshot.data[newsNo].urlToImage,
                              fit: BoxFit.contain,
                              height: 200,
                            ),
                          ),
                          Container(
                            height: 125,
                            child: AutoSizeText(
                              '${snapshot.data[newsNo].description}',
                              style: TextStyle(fontSize: 15),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(0xFFEDEAF8),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '${snapshot.data[(newsNo + 1) % (_list.length)].title}',
                        style:
                            TextStyle(color: Color(0xFF5855BD), fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else
            return SizedBox();
        },
      ),
    );
  }
}
