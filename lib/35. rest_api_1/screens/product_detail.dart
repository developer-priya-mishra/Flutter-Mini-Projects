import 'package:flutter/material.dart';
import 'package:learn_flutter/35.%20rest_api_1/models/product.dart';
import 'package:learn_flutter/35.%20rest_api_1/services/api_service.dart';

class ProductDetail extends StatelessWidget {
  final int id;
  const ProductDetail({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
      ),
      body: FutureBuilder(
        future: ApiService().getSingleProduct(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Product product = snapshot.data;
            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(height: 30.0),
                    Image.network(
                      product.image,
                      height: 200.0,
                      width: double.infinity,
                    ),
                    SizedBox(height: 10.0),
                    Center(
                      child: Text(
                        "\$${product.price}",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      product.title,
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Chip(
                      label: Text(
                        product.category.toUpperCase(),
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.blueGrey,
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      product.description,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await ApiService().updateCart(1, id);
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Product added to cart"),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.add_shopping_cart_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
