import 'package:examapi/diff.dart';
import 'package:examapi/first.dart';
import 'package:examapi/futurebuider.dart';
import 'package:examapi/postapifutbilder.dart';
import 'package:examapi/second.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: postapi(),
  ));
}

class exam extends StatefulWidget {
  const exam({Key? key}) : super(key: key);

  @override
  State<exam> createState() => _examState();
}

class _examState extends State<exam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("EXAM"))),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(children: [
          SizedBox(
            height: 15,
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return first();
                },
              ));
            },
            title: Text("first"),
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return second();
                },
              ));
            },
            title: Text("second"),
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return apibilder();
                },
              ));
            },
            title: Text("futurebuilder api"),
          )
        ]),
      ),
    );
  }
}
