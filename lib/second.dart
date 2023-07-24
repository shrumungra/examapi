import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

class second extends StatefulWidget {
  const second({Key? key}) : super(key: key);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  product? temp;
  bool status = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get1();
    // request();
  }

  Future<void> get1() async {
    var url = Uri.parse('https://dummyjson.com/products');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    var map = jsonDecode(response.body);
    print("====${map}");

    setState(() {
      temp = product.fromJson(map);
      status = true;

      print("===========${temp!.products![1]}");
    });
  }

  final dio = Dio(BaseOptions(responseType:ResponseType.plain));
  void request() async {
    Response response;
    response = await dio.get('https://dummyjson.com/products');
    print(response.data.toString());

    var map = jsonDecode(response.data.toString());

    setState(() {
      temp = product.fromJson(map);
      status = true;

      print("${temp!.products![1]}");
    });

  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text("get api"))),
        backgroundColor: Colors.grey.shade200,
        body: status
            ? ListView.builder(
          itemCount: temp!.products!.length,
          // itemCount: 1,
          itemBuilder: (context, index) {
            return Card(elevation: 20,
              child: ListTile(
                  onTap: () {

                  },
                  leading: CircleAvatar(backgroundColor: Colors.white,maxRadius: 20,
                      child: Image(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "${temp!.products![index].thumbnail}"))),
                  title: Text("${temp!.products![index].title}"),
                  subtitle: Text("${temp!.products![index].price}/-")),
            );
          },
        )
            : Center(child: CircularProgressIndicator())
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

  Products(
      {this.id,
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
