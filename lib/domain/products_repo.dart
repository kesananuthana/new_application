import 'package:myapplication/models/products_model.dart';

abstract class ProductsRepo {
  Future<List<ProductsModel>> getProducts();
  Future<String> deleteProducts();
  Future<String> deleteProdcutById(String pid);
}
