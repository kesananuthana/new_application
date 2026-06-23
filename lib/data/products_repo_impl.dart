import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapplication/domain/products_repo.dart';
import 'package:myapplication/models/products_model.dart';

class ProductsRepoImpl implements ProductsRepo {
  @override
  Future<String> addProducts(String pid, String name, int price) async {
    final response = await http.post(
      Uri.parse("https://go-application.onrender.com/addProducts"),
      body: jsonEncode({"pid": pid, "name": name, "price": price}),
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return result["message"];
    }
    return '';
  }

  @override
  Future<List<ProductsModel>> getProducts() async {
    final response = await http.get(
      Uri.parse("https://go-application.onrender.com/products"),
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      if (result == null) {
        return [];
      }
      return result
          .map<ProductsModel>((e) => ProductsModel.fromJson(e))
          .toList();
    }

    return [];
  }

  @override
  Future<String> deleteProducts() async {
    final response = await http.delete(
      Uri.parse("https://go-application.onrender.com/deleteProducts"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["message"];
    }
    return '';
  }

  @override
  Future<String> deleteProdcutById(String pid) async {
    final response = await http.delete(
      Uri.parse("https://go-application.onrender.com/deletProducts/$pid"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["message"];
    }
    return '';
  }

  @override
  Future<String> updateProduct(String pid, String name, int price) async {
    final response = await http.put(
      Uri.parse("https://go-application.onrender.com/updateProductById/$pid"),
      body: jsonEncode({"name": name, "price": price}),
    );
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return result["message"];
    }
    return '';
  }
}
