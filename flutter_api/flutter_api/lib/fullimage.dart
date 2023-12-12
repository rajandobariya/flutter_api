import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/model/lexica.dart';

class LexicaFullScreen extends StatefulWidget {
  List<Lexica> lexicaList = [];
  int index = 0;


  LexicaFullScreen({required this.lexicaList, required this.index});

  @override
  _LexicaFullScreen createState() => _LexicaFullScreen(lexicaList: lexicaList, index: index);
}

class _LexicaFullScreen extends State<LexicaFullScreen> {
  List<Lexica> lexicaList = [];
  int index = 0;
  _LexicaFullScreen({required this.lexicaList, required this.index});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        // centerTitle: true,
        title: Text(
          '${lexicaList[index].height}',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: TextField(
                style: TextStyle(fontSize: 18, color: Colors.black),
                onChanged: (value) {
                  debugPrint("Something changed in Title Text Field");
                },
                decoration: InputDecoration(
                    labelText: "Title",
                    labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              )),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  "https://image.lexica.art/full_webp/${lexicaList[index].id}",
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
