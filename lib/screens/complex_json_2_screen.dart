import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_json_exam/models/model.dart';

class ComplexJson2Screen extends StatefulWidget {
  @override
  _ComplexJson2ScreenState createState() => _ComplexJson2ScreenState();
}

class _ComplexJson2ScreenState extends State<ComplexJson2Screen> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<Film>> films() async {
    String data =
        '{"success":1,"films":[{"id":1,"name":"anotalia","img":"anatolia.png","director":{"id":1,"name":"Nuri Bilge Ceylan"},"category":{"id":1,"name":"Dram"}},{"id":2,"name":"Django","img":"django.png","director":{"id":2,"name":"Quentin Tarantino"},"category":{"id":2,"name":"Dram"}}]}';
    final complex = ComplexFilm.fromJson(await json.decode(data));
    final film = complex.film;
    final success = complex.success;
    return film!;
  }

  Widget filmWidget(List<Film> film, int index) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            width: 200.0,
            height: 200.0,
            child: Image.asset(
              'assets/images/${film[index].img!}',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'film: ${film[index].name}',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'director: ${film[index].director!.name}',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'category: ${film[index].category!.name}',
              style: TextStyle(color: Colors.white),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Complex Json Parse'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
            child: FutureBuilder<List<Film>>(
              future: films(),
              builder: (context, constraint) {
                if (constraint.hasData) {
                  final film = constraint.data;
                  return ListView.builder(
                    itemCount: film!.length,
                    itemBuilder: (context, index) => filmWidget(film, index),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
