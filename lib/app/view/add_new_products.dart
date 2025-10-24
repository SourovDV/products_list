import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddNewProducts extends StatefulWidget {
  AddNewProducts({super.key});
  @override
  State<AddNewProducts> createState() => _AddNewProductsState();
}

class _AddNewProductsState extends State<AddNewProducts> {
  final form_key = GlobalKey<FormState>();

  final TextEditingController _productName = TextEditingController();

  final TextEditingController _productPrice = TextEditingController();

  final TextEditingController _totalProductPrice = TextEditingController();

  final TextEditingController _productQuentity = TextEditingController();

  final TextEditingController _productCode = TextEditingController();

  final TextEditingController _productImage = TextEditingController();

  bool _addloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Visibility(
        visible: _addloading == false,
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
        child: Form(
          key: form_key,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  TextFormField(
                    controller: _productName,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: "Product Name",
                      hintText: "Name",
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return "Enter product name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _productPrice,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: "Product Price",
                      hintText: "Price",
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return "Enter product price";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _totalProductPrice,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: "Total Product price",
                      hintText: "total price",
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return "Enter product total price";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _productQuentity,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: "Product quantity",
                      hintText: "Quentity",
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return "Enter product quentity";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _productCode,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: "Product code",
                      hintText: "code",
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return "Enter product code";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _productImage,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: "Product Image url",
                      hintText: "image url",
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return "Enter product image url";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (form_key.currentState!.validate()) {
                        _addedProduct();

                      } else {
                        // validation fail হলে
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please fix the errors ❌")),
                        );
                      }
                    },
                    child: Text("Add Product"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _addedProduct() async {
    _addloading=true;
    setState(() {});
    Uri uri = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");

    Map<String, dynamic> requestBody = {
      "Img": _productImage.text.trim(),
      "ProductCode": _productCode.text.trim(),
      "ProductName": _productName.text.trim(),
      "Qty": _productQuentity.text.trim(),
      "TotalPrice": _totalProductPrice.text.trim(),
      "UnitPrice": _productPrice.text.trim(),
    };

    Response response = await post(
      uri,
      headers: {
        'Content-type':"application/json"
      },
      body: jsonEncode(requestBody),
    );
    print(response.body);
    print(response.statusCode);
    if(response.statusCode == 200 ){
      _deleteSpace();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("sucess")));
      Navigator.pop(context, true);
    }

    _addloading=false;
    setState(() {});
  }

  void _deleteSpace(){
    _productName.clear();
    _productPrice.clear();
    _totalProductPrice.clear();
    _productQuentity.clear();
    _productCode.clear();
    _productImage.clear();
  }

  @override
  void dispose() {
    _productName.dispose();
    _productPrice.dispose();
    _totalProductPrice.dispose();
    _productQuentity.dispose();
    _productCode.dispose();
    _productImage.dispose();
    super.dispose();
  }
}
