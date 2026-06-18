import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapplication/data/products_repo_impl.dart';

final productsProvider = FutureProvider((ref) {
  final ProductsRepoImpl productsRepo = ProductsRepoImpl();
  return productsRepo.getProducts();
});
