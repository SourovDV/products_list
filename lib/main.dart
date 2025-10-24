import 'package:flutter/material.dart';
import 'package:products_list/app/view/add_new_products.dart';
import 'package:products_list/app/view/home.dart';
import 'package:products_list/app/view/update_product.dart';

void main(){
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context)=>const ProductList(),
        '/update':(context)=> UpdateProduct(),
        '/add':(context)=>AddNewProducts()
      },

    );
  }
}
