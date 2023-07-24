import 'dart:convert';

import 'package:examapi/sp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  TextEditingController mobile = TextEditingController();
  TextEditingController pass = TextEditingController();
  Data? data;
  bool status=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("post api"))),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(children: [
          Card(
            elevation: 20,
            color: Colors.blue.shade100,
            child: TextField(
              controller: mobile,
              style: TextStyle(fontSize: 22),
              autofocus: true,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.call),
                  border: InputBorder.none,
                  hintText: "mobile number",
                  hintStyle: TextStyle(fontSize: 22)),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Card(
            elevation: 20,
            color: Colors.blue.shade100,
            child: TextField(
              controller: pass,
              obscureText: true,
              style: TextStyle(fontSize: 22),
              autofocus: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_open),
                  border: InputBorder.none,
                  hintText: "password",
                  hintStyle: TextStyle(fontSize: 22)),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(onPressed: () async {

            Map key = {"mobile": mobile.text, "password": pass.text};
            // var url = Uri.parse('https://parcel.cscodetech.com/de_api/dboy_login.php');
            // var response = await http.post(url, body: key);
            // print('Response status: ${response.statusCode}');
            // print('Response body: ${response.body}');

            final dio = Dio();
            Response response;
            response = await dio.post('https://parcel.cscodetech.com/de_api/dboy_login.php',data: key);
            print(response.data.toString());

            var map= jsonDecode(response.data.toString());

            setState(() {
              data =Data.fromJson(map);
              status = true;
            });

            if(data!.result=="true"){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("login succesfully")));

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return sp(data!.dboydata);
              },));
            }
            else{
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("user not found")));
            }

          }, child: Text("submit"))
        ]),
      ),
    );
  }
}

class Data {
  Dboydata? dboydata;
  String? currency;
  String? responseCode;
  String? result;
  String? responseMsg;

  Data(
      {this.dboydata,
        this.currency,
        this.responseCode,
        this.result,
        this.responseMsg});

  Data.fromJson(Map<String, dynamic> json) {
    dboydata = json['dboydata'] != null
        ? new Dboydata.fromJson(json['dboydata'])
        : null;
    currency = json['currency'];
    responseCode = json['ResponseCode'];
    result = json['Result'];
    responseMsg = json['ResponseMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dboydata != null) {
      data['dboydata'] = this.dboydata!.toJson();
    }
    data['currency'] = this.currency;
    data['ResponseCode'] = this.responseCode;
    data['Result'] = this.result;
    data['ResponseMsg'] = this.responseMsg;
    return data;
  }
}

class Dboydata {
  String? id;
  String? title;
  String? rimg;
  String? status;
  String? rate;
  String? lcode;
  String? fullAddress;
  String? pincode;
  String? landmark;
  String? commission;
  String? bankName;
  String? ifsc;
  String? receiptName;
  String? accNumber;
  String? paypalId;
  String? upiId;
  String? email;
  String? password;
  String? rstatus;
  String? mobile;
  String? accept;
  String? reject;
  String? complete;
  String? dzone;
  String? vehiid;
  String? veImg;

  Dboydata(
      {this.id,
        this.title,
        this.rimg,
        this.status,
        this.rate,
        this.lcode,
        this.fullAddress,
        this.pincode,
        this.landmark,
        this.commission,
        this.bankName,
        this.ifsc,
        this.receiptName,
        this.accNumber,
        this.paypalId,
        this.upiId,
        this.email,
        this.password,
        this.rstatus,
        this.mobile,
        this.accept,
        this.reject,
        this.complete,
        this.dzone,
        this.vehiid,
        this.veImg});

  Dboydata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    rimg = json['rimg'];
    status = json['status'];
    rate = json['rate'];
    lcode = json['lcode'];
    fullAddress = json['full_address'];
    pincode = json['pincode'];
    landmark = json['landmark'];
    commission = json['commission'];
    bankName = json['bank_name'];
    ifsc = json['ifsc'];
    receiptName = json['receipt_name'];
    accNumber = json['acc_number'];
    paypalId = json['paypal_id'];
    upiId = json['upi_id'];
    email = json['email'];
    password = json['password'];
    rstatus = json['rstatus'];
    mobile = json['mobile'];
    accept = json['accept'];
    reject = json['reject'];
    complete = json['complete'];
    dzone = json['dzone'];
    vehiid = json['vehiid'];
    veImg = json['ve_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['rimg'] = this.rimg;
    data['status'] = this.status;
    data['rate'] = this.rate;
    data['lcode'] = this.lcode;
    data['full_address'] = this.fullAddress;
    data['pincode'] = this.pincode;
    data['landmark'] = this.landmark;
    data['commission'] = this.commission;
    data['bank_name'] = this.bankName;
    data['ifsc'] = this.ifsc;
    data['receipt_name'] = this.receiptName;
    data['acc_number'] = this.accNumber;
    data['paypal_id'] = this.paypalId;
    data['upi_id'] = this.upiId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['rstatus'] = this.rstatus;
    data['mobile'] = this.mobile;
    data['accept'] = this.accept;
    data['reject'] = this.reject;
    data['complete'] = this.complete;
    data['dzone'] = this.dzone;
    data['vehiid'] = this.vehiid;
    data['ve_img'] = this.veImg;
    return data;
  }
}

