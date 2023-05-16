import 'package:flutter/material.dart';
import 'package:learn_flutter/35.%20rest_api_1/models/product.dart';
import 'package:learn_flutter/35.%20rest_api_1/services/api_service.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: FutureBuilder(
        future: ApiService().getCart('1'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List products = snapshot.data['products'];
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return FutureBuilder(
                  future: ApiService()
                      .getSingleProduct(products[index]['productId']),
                  builder: (context, asyncSnapshot) {
                    if (asyncSnapshot.hasData) {
                      Product product = asyncSnapshot.data;
                      return ListTile(
                        title: Text(product.title),
                        leading: Image.network(
                          product.image,
                          height: 40.0,
                        ),
                        subtitle:
                            Text("Quantity - ${products[index]['quantity']}"),
                        trailing: IconButton(
                          onPressed: () async {
                            await ApiService().deleteCart('1');
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Product deleted from cart"),
                                  backgroundColor: Colors.black,
                                ),
                              );
                            }
                          },
                          icon: Icon(
                            Icons.delete_rounded,
                            color: Colors.red,
                          ),
                        ),
                      );
                    }
                    return LinearProgressIndicator();
                  },
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 60.0,
        width: double.infinity,
        color: Colors.green,
        child: Center(
          child: Text(
            "Order Now",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),
          ),
        ),
      ),
    );
  }
}
