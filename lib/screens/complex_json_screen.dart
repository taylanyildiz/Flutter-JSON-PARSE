import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_json_exam/models/model.dart';
import 'package:flutter_json_exam/screens/complex_json_2_screen.dart';
import 'package:flutter_json_exam/widgets/transition.dart';

class ComplexJsonScreen extends StatefulWidget {
  @override
  _ComplexJsonScreenState createState() => _ComplexJsonScreenState();
}

class _ComplexJsonScreenState extends State<ComplexJsonScreen> {
  Future<List<User>> users() async {
    String data =
        '{"success":1,"users":[{"id":1,"name":"Taylan","mail":"taylan@outlook.com"},{"id":2,"name":"Mazlum","mail":"mazlum@outlook.com"},{"id":3,"name":"Can","mail":"can@outlook.com"},{"id":4,"name":"Eylul","mail":"eylul@outlook.com"}]}';
    final complex = ComplexUser.fromJson(json.decode(data));
    final user = complex.user;
    final success = complex.success;
    await Future.delayed(Duration(seconds: 5));
    return user!;
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
        centerTitle: true,
        title: Text('Complex Json Parse'),
      ),
      body: Stack(
        children: [
          FutureBuilder<List<User>>(
            future: users(),
            builder: (context, constraint) {
              if (constraint.hasData) {
                final user = constraint.data;
                return ListView.builder(
                  itemCount: user!.length,
                  itemBuilder: (context, index) => userWidget(user, index),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        onPressed: () =>
            Navigator.push(context, createRoute(ComplexJson2Screen())),
        child: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
