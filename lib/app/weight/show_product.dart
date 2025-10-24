import 'package:flutter/material.dart';
import 'package:products_list/app/models/product.dart';
import 'package:products_list/app/view/update_product.dart';

class ShowProduct extends StatelessWidget {
  const ShowProduct({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        shape: Border.all(color: Colors.grey),
        contentPadding: EdgeInsets.all(10),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("${product.image}")
        ),

        title: Text("${product.productName}"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Product code : ${product.productCode}"),
            Text("quentity: ${product.quentity}"),
            Text("price : ${product.product_price}"),
            Text("Total Price : ${product.uniqePrice}")
          ],
        ),
        trailing:Wrap(
          children: [
            Icon(Icons.delete),
            SizedBox(width: 10,),
            InkWell(
              onTap:()=> Navigator.pushNamed(context,'/update'),
                child: Icon(Icons.edit))
          ],
        )

    );
  }
}
