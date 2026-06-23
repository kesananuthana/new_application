import 'package:myapplication/models/products_model.dart';

abstract class ProductsRepo {
  Future<String> addProducts(String pid, String name, int price);
  Future<List<ProductsModel>> getProducts();
  Future<String> updateProduct(String pid, String name, int price);
  Future<String> deleteProducts();
  Future<String> deleteProdcutById(String pid);
}
