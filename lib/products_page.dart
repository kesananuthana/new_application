import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapplication/data/products_repo_impl.dart';
import 'package:myapplication/provider/products_provider.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsData = ref.watch(productsProvider);
    return Scaffold(
      appBar: AppBar(title: Text('List of Products'), centerTitle: true),
      body: productsData.when(
        data: (product) {
          return product.isNotEmpty
              ? ListView.builder(
                  itemCount: product.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text('Product Id: ${product[index].pid}'),
                      title: Text('Name : ${product[index].name}'),
                      subtitle: Text(
                        'Price : ${product[index].price.toString()}',
                      ),
                      trailing: GestureDetector(
                        onTap: () async {
                          try {
                            final message = await ProductsRepoImpl()
                                .deleteProducts();
                            ref.invalidate(productsProvider);
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(SnackBar(content: Text(message)));
                          } catch (e) {
                            print(e);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())),
                            );
                          }
                        },
                        child: Icon(Icons.delete),
                      ),
                    );
                  },
                )
              : Center(child: Text('No products found'));
        },
        error: (error, stack) => Text(error.toString()),
        loading: () => Center(child: CircularProgressIndicator.adaptive()),
      ),
    );
  }
}
