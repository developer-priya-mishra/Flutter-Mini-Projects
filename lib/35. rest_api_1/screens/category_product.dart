import 'package:flutter/material.dart';
import 'package:learn_flutter/35.%20rest_api_1/models/product.dart';
import 'package:learn_flutter/35.%20rest_api_1/services/api_service.dart';
import 'package:learn_flutter/35.%20rest_api_1/screens/product_detail.dart';

class CategoryProduct extends StatelessWidget {
  final String categoryName;
  const CategoryProduct({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName.toUpperCase()),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiService().getProductByCategory(categoryName),
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
