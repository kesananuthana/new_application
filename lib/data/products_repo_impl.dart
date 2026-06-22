import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapplication/domain/products_repo.dart';
import 'package:myapplication/models/products_model.dart';

class ProductsRepoImpl implements ProductsRepo {
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
      return response.body;
    }
    return '';
  }
}
