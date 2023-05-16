import 'package:flutter/material.dart';
import 'package:learn_flutter/35.%20rest_api_1/models/product.dart';
import 'package:learn_flutter/35.%20rest_api_1/screens/all_categories.dart';
import 'package:learn_flutter/35.%20rest_api_1/services/api_service.dart';
import 'package:learn_flutter/35.%20rest_api_1/screens/cart.dart';
import 'package:learn_flutter/35.%20rest_api_1/screens/product_detail.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rest Api 1"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AllCategory(),
                ),
              );
            },
            icon: Icon(Icons.view_list_rounded),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ),
              );
            },
            icon: Icon(Icons.shopping_cart_rounded),
          ),
        ],
      ),
      body: FutureBuilder(
        future: ApiService().getAllPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                Product product = snapshot.data[index];
                return ListTile(
                  leading: Image.network(
                    product.image,
                    height: 50.0,
                    width: 30.0,
                  ),
                  title: Text(product.title),
                  subtitle: Text("Price - \$${product.price}"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetail(id: product.id),
                      ),
                    );
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
    );
  }
}
