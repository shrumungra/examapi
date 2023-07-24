import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:examapi/sp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class postapi extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Center(child: Text("post api"))),
        body: Padding(
          padding: const EdgeInsets.all(13.0),
          child: FutureBuilder(
            future: get1(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print("==${snapshot.data!.userdata!.eMAIL}");
                if (snapshot.data!.result == 1) {
                  return Center(child: Text("login"));
                } else {
                  return Center(child: Text("user not found"));
                }
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
Future<Data> get1() async {
  Map map = {'name': "Sbmungra@gmail.com", 'password': "Shruti@21"};
  var url =
  Uri.parse('https://mugra216.000webhostapp.com/register/login.php');
  var response = await http.post(url, body: map);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  var result = jsonDecode(response.body);
  Data data = Data.fromJson(result);

  return data;
}
class Data {
  int? connection;
  int? result;
  Userdata? userdata;

  Data({this.connection, this.result, this.userdata});

  Data.fromJson(Map<String, dynamic> json) {
    connection = json['connection'];
    result = json['result'];
    userdata = json['userdata'] != null
        ? new Userdata.fromJson(json['userdata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['connection'] = this.connection;
    data['result'] = this.result;
    if (this.userdata != null) {
      data['userdata'] = this.userdata!.toJson();
    }
    return data;
  }
}

class Userdata {
  String? iD;
  String? nAME;
  String? eMAIL;
  String? nUMBER;
  String? pASSWORD;
  String? cONPASS;
  String? iMAGE;

  Userdata(
      {this.iD,
      this.nAME,
      this.eMAIL,
      this.nUMBER,
      this.pASSWORD,
      this.cONPASS,
      this.iMAGE});

  Userdata.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    nAME = json['NAME'];
    eMAIL = json['EMAIL'];
    nUMBER = json['NUMBER'];
    pASSWORD = json['PASSWORD'];
    cONPASS = json['CONPASS'];
    iMAGE = json['IMAGE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['NAME'] = this.nAME;
    data['EMAIL'] = this.eMAIL;
    data['NUMBER'] = this.nUMBER;
    data['PASSWORD'] = this.pASSWORD;
    data['CONPASS'] = this.cONPASS;
    data['IMAGE'] = this.iMAGE;
    return data;
  }
}
