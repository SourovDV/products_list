import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:products_list/app/models/product.dart';
import 'package:products_list/app/view/add_new_products.dart';
import 'package:products_list/app/weight/show_product.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  List<Product> _productList = [];
  bool _getProductProgress = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products list"),
      ),
      body: Visibility(
        visible: _getProductProgress == false,
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: _productList.length,
            itemBuilder:(context,index){
              return ShowProduct(product: _productList[index],);
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(context, '/add');
          if (result == true) {
            _getProducts(); // নতুন product load
          }
        },
        child: Icon(Icons.add),
      ),

    );
  }

  Future<void> _getProducts()async{
    _getProductProgress = true;
    setState(() {});
    Uri uri = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
    Response response = await get(uri);
    if(response.statusCode ==200){
      final _decodeResponse = jsonDecode(response.body);
      for(Map<String, dynamic> p in _decodeResponse["data"] ){
        final products = Product(
          productName: p["ProductName"],
          product_price: p["TotalPrice"],
          uniqePrice: p["UnitPrice"],
          quentity: p["Qty"],
          created_date: p["CreatedDate"],
          id: p["_id"],
          productCode: p["ProductCode"],
          image: p["Img"]
        );
        _productList.add(products);
      }
      setState(() {});
    };
    _getProductProgress = false;
    setState(() {});
  }

}
