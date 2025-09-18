import 'dart:convert';

import 'package:api_demo/post_model.dart';
import 'package:api_demo/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Users> userList = [];

  @override
  void initState() {
    super.initState();
    getApiData();
  }

  Future<void> getApiData() async {
    String url = 'https://dummyjson.com/users';
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      final result = jsonDecode(response.body);
      UserModel userModel = UserModel.fromJson(result);

      userList = userModel.users!;
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
        itemCount: userList.length,
        padding: const EdgeInsets.all(20),
          itemBuilder: (context, index) {
            Users model = userList[index];
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
                  Text(model.firstName.toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(model.phone.toString(),
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
            );
          },
      ),
    );
  }
}
