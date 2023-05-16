import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learn_flutter/35.%20rest_api_1/models/product.dart';

class ApiService {
  Future getAllPosts() async {
    final allProductUrl = Uri.parse("https://fakestoreapi.com/products");
    final response = await http.get(allProductUrl);
    List<Product> allProducts = [];
    List body = json.decode(response.body);
    for (var product in body) {
      allProducts.add(Product.fromJson(product));
    }
    // debugPrint(response.statusCode.toString());
    // debugPrint(response.body);
    return allProducts;
  }

  Future getSingleProduct(int id) async {
    final singleProductUrl = Uri.parse("https://fakestoreapi.com/products/$id");
    final response = await http.get(singleProductUrl);
    // debugPrint(response.statusCode.toString());
    // debugPrint(response.body);
    var body = json.decode(response.body);
    return Product.fromJson(body);
  }

  Future getAllCategory() async {
    final allCategoryUrl = Uri.parse("https://fakestoreapi.com/products/categories");
    final response = await http.get(allCategoryUrl);
    // debugPrint(response.statusCode.toString());
    // debugPrint(response.body);
    return json.decode(response.body);
  }

  Future getProductByCategory(String catName) async {
    final fetchProductCategoryUrl =
        Uri.parse("https://fakestoreapi.com/products/category/$catName");
    final response = await http.get(fetchProductCategoryUrl);
    List<Product> allProducts = [];
    List body = json.decode(response.body);
    for (var product in body) {
      allProducts.add(Product.fromJson(product));
    }
    // debugPrint(response.statusCode.toString());
    // debugPrint(response.body);
    return allProducts;
  }

  Future getCart(String userId) async {
    final fetchCartProducts = Uri.parse("https://fakestoreapi.com/carts/$userId");
    final response = await http.get(fetchCartProducts);
    // debugPrint(response.statusCode.toString());
    // debugPrint(response.body);
    return json.decode(response.body);
  }

  Future userLogin(String username, String password) async {
    final loginUrl = Uri.parse("https://fakestoreapi.com/auth/login");
    final response = await http.post(loginUrl, body: {
      'username': username,
      'password': password,
    });
    // debugPrint(response.statusCode.toString());
    // debugPrint(response.body);
    return json.decode(response.body);
  }

  Future updateCart(int userId, int productId) async {
    final updateCartUrl = Uri.parse("https://fakestoreapi.com/carts/$userId");
    final response = await http.put(updateCartUrl, body: {
      'userId': "$userId",
      'date': DateTime.now().toString(),
      'products': [
        {
          "productId": "$productId",
          "quantity": 1,
        }
      ].toString(),
    });
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    return json.decode(response.body);
  }

  Future deleteCart(String userId) async {
    final deleteCartUrl = Uri.parse("https://fakestoreapi.com/carts/$userId");
    final response = await http.delete(deleteCartUrl);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    return json.decode(response.body);
  }

  Future userAuthentication(String username, String password) async {
    final authUrl = Uri.parse("https://api.somewhere.io");
    final response = await http.post(authUrl, body: {
      'username': username,
      'password': password,
    });
    // debugPrint(response.statusCode.toString());
    // debugPrint(response.body);
    return json.decode(response.body);
  }

  Future userAuthorization(String username, String password) async {
    final authUrl = Uri.parse("https://api.somewhere.io");

    // String basicAuth = 'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    const accessToken = "";

    final response = await http.get(authUrl, headers: {
      'Content-Type': 'application/json',
      'authorization': "Bearer $accessToken",
    });
    // debugPrint(response.statusCode.toString());
    // debugPrint(response.body);
    return json.decode(response.body);
  }
}
