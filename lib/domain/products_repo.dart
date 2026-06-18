import 'package:myapplication/models/products_model.dart';

abstract class ProductsRepo {
  Future<List<ProductsModel>> getProducts();
}
