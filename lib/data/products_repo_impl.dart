import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapplication/domain/products_repo.dart';
import 'package:myapplication/models/products_model.dart';

class ProductsRepoImpl implements ProductsRepo {
  @override
  Future<List<ProductsModel>> getProducts() async {
    List<ProductsModel> products = <ProductsModel>[];
    final response = await http.get(
      Uri.parse("https://go-application.onrender.com/products"),
    );
    print('response :${response.body}');

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      products = result
          .map<ProductsModel>((e) => ProductsModel.fromJson(e))
          .toList();
    }

    return products;
  }
}
