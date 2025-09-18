import 'dart:convert';

import 'package:api_demo/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Posts> postList = [];

  @override
  void initState() {
    super.initState();
    getApiData();
  }

  Future<void> getApiData() async {
    String url = 'https://dummyjson.com/posts';
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      final result = jsonDecode(response.body);
      PostModel postModel = PostModel.fromJson(result);

      postList = postModel.posts!;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Demo',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: postList.length,
        padding: const EdgeInsets.all(20),
          itemBuilder: (context, index) {
            Posts model = postList[index];
            return Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.title.toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(model.body.toString(),
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text('Likes: ${model.reactions!.likes}',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(width: 10),
                      Text('Dislikes: ${model.reactions!.dislikes}',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
      ),
    );
  }
}
