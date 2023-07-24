import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class apibilder extends StatefulWidget {
  const apibilder({super.key});

  @override
  State<apibilder> createState() => _apibilderState();
}

class _apibilderState extends State<apibilder> {
  @override

  Future<product> get1() async {
    var url = Uri.parse('https://dummyjson.com/products');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    var result = jsonDecode(response.body);
    product tt = product.fromJson(result);
    return tt;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("futurebuilder apicall")),
      body: FutureBuilder(
        future: get1(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("==${snapshot.data!.products!.length}");
            return ListView.builder(
              itemCount: snapshot.data!.products!.length,
              // itemCount: 1,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 20,
                  child: ListTile(leading: CircleAvatar(backgroundImage: NetworkImage("${snapshot.data!.products![index].thumbnail}"),),),
                );
              },
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

class product {
  List<Products>? products;
  int? total;
  int? skip;
  int? limit;

  product({this.products, this.total, this.skip, this.limit});

  product.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}

class Products {
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  var rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  Products({this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discountPercentage'] = this.discountPercentage;
    data['rating'] = this.rating;
    data['stock'] = this.stock;
    data['brand'] = this.brand;
    data['category'] = this.category;
    data['thumbnail'] = this.thumbnail;
    data['images'] = this.images;
    return data;
  }
}
