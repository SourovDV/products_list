import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products list"),
      ),
      body: ListView.builder(
          itemBuilder:(context,index){
            return ListTile(
              shape: Border.all(color: Colors.grey),
              contentPadding: EdgeInsets.all(10),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network("data:image/jpeg;base64,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",),
              ),

              title: Text("Product name"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product code 234324"),
                  Text("quentity: 54"),
                  Text("price : 23434"),
                  Text("Total Price : 34345")
                ],
              ),
              trailing:Wrap(
                children: [
                  Icon(Icons.delete),
                  SizedBox(width: 10,),
                  Icon(Icons.edit)
                ],
              )
              
            );
          }
      ),
    );
  }
}
