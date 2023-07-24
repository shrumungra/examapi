import 'package:examapi/first.dart';
import 'package:flutter/material.dart';

class sp extends StatefulWidget {
  Dboydata? dboydata;

  sp(this.dboydata);

  @override
  State<sp> createState() => _spState();
}

class _spState extends State<sp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DBOYDATA")),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Center(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
          Text("ID: ${widget.dboydata!.id}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
          Text("${widget.dboydata!.title}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23)),
          Text("mobile: ${widget.dboydata!.mobile}",style: TextStyle(fontSize: 20)),
          Text("email: ${widget.dboydata!.email}",style: TextStyle(fontSize: 20)),
          Text("accNumber: ${widget.dboydata!.accNumber}",style: TextStyle(fontSize: 20)),
          Text("bankName: ${widget.dboydata!.bankName}",style: TextStyle(fontSize: 20)),
          Text("fullAddress: ${widget.dboydata!.fullAddress}",style: TextStyle(fontSize: 20)),
          Text("pincode: ${widget.dboydata!.pincode}",style: TextStyle(fontSize: 20)),
          Text("ifsc: ${widget.dboydata!.ifsc}",style: TextStyle(fontSize: 20)),
          Text("landmark: ${widget.dboydata!.landmark}",style: TextStyle(fontSize: 20)),
        ])),
      ),
    );
  }
}
