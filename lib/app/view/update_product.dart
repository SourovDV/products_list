import 'package:flutter/material.dart';

class UpdateProduct extends StatelessWidget {
   UpdateProduct({super.key});
  final form_key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: form_key,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                TextFormField(
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
                ElevatedButton(onPressed: () {
                  if(form_key.currentState!.validate()){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Form is valid ✅")),
                    );
                  }else{
                    // validation fail হলে
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please fix the errors ❌")),
                    );
                  }
                }, child: Text("Update Product")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
