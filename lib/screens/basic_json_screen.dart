import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_json_exam/models/model.dart';
import 'package:flutter_json_exam/screens/complex_json_screen.dart';
import 'package:flutter_json_exam/widgets/transition.dart';

class BasicJsonScreen extends StatefulWidget {
  BasicJsonScreen({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;
  @override
  _BasicJsonScreenState createState() => _BasicJsonScreenState();
}

class _BasicJsonScreenState extends State<BasicJsonScreen> {
  @override
  void initState() {
    super.initState();
  }

  Stream<List<User>> users() async* {
    String data =
        '{"users":[{"id":1,"name":"Taylan","mail":"taylan@outlook.com"},{"id":2,"name":"Mazlum","mail":"mazlum@outlook.com"},{"id":3,"name":"Can","mail":"can@outlook.com"},{"id":4,"name":"Eylul","mail":"eylul@outlook.com"}]}';

    final jsonData = await json.decode(data);
    final jsonArray = jsonData['users'] as List;
    final users = jsonArray.map((e) => User.fromJson(e)).toList();
    await Future.delayed(Duration(seconds: 5));
    yield users;
  }

  Widget userWidget(List<User> userList, int index) {
    final random = Random();
    final color = Color.fromARGB(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
    );
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(
          userList[index].name![0],
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(
        '${userList[index].id}-) ${userList[index].name}',
        style: TextStyle(
          color: Colors.red,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        '${userList[index].mail}',
        style: TextStyle(
          color: Colors.orange,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: IconButton(
        onPressed: () => print('more'),
        color: Colors.black,
        icon: Icon(
          Icons.more_vert,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Json Decoder'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          StreamBuilder<List<User>>(
            stream: users(),
            builder: (context, constraint) {
              if (constraint.hasData) {
                final user = constraint.data;
                return ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) => userWidget(user!, index),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          createRoute(ComplexJsonScreen()),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        child: Icon(
          Icons.arrow_forward_ios,
        ),
      ),
    );
  }
}
