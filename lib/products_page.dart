import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapplication/data/products_repo_impl.dart';
import 'package:myapplication/models/products_model.dart';
import 'package:myapplication/provider/products_provider.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsData = ref.watch(productsProvider);
    return Scaffold(
      appBar: AppBar(title: Text('List of Products'), centerTitle: true),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  _showDailog(context, ref);
                },
                child: Icon(Icons.add),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () async {
                  final message = await ProductsRepoImpl().deleteProducts();
                  ref.invalidate(productsProvider);
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(message)));
                },
                child: Icon(Icons.delete),
              ),
            ],
          ),
          Expanded(
            child: productsData.when(
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
                            trailing: SizedBox(
                              height: 50,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      print('clicked');
                                      _showDetails(
                                        context,
                                        product[index],
                                        ref,
                                      );
                                    },
                                    child: Icon(Icons.edit),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      final message = await ProductsRepoImpl()
                                          .deleteProdcutById(
                                            product[index].pid,
                                          );
                                      ref.invalidate(productsProvider);
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(content: Text(message)),
                                      );
                                    },
                                    child: Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : Center(child: Text('No products found'));
              },
              error: (error, stack) => Text(error.toString()),
              loading: () =>
                  Center(child: CircularProgressIndicator.adaptive()),
            ),
          ),
        ],
      ),
    );
  }

  void _showDailog(context, WidgetRef ref) {
    final TextEditingController pidController = TextEditingController(),
        nameController = TextEditingController(),
        priceController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Column(
            children: [
              TextFormField(controller: pidController),
              TextFormField(controller: nameController),
              TextFormField(controller: priceController),
              ElevatedButton(
                onPressed: () async {
                  final message = await ProductsRepoImpl().addProducts(
                    pidController.text,
                    nameController.text,
                    int.parse(priceController.text),
                  );
                  ref.invalidate(productsProvider);
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(message)));
                },
                child: Text('Save'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDetails(
    BuildContext context,
    ProductsModel product,
    WidgetRef ref,
  ) {
    final TextEditingController pidController = TextEditingController(),
        nameController = TextEditingController(),
        priceController = TextEditingController();
    pidController.text = product.pid;
    nameController.text = product.name;
    priceController.text = product.price.toString();
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(controller: pidController),
                TextFormField(controller: nameController),
                TextFormField(controller: priceController),
                ElevatedButton(
                  onPressed: () async {
                    final message = await ProductsRepoImpl().updateProduct(
                      product.pid,
                      nameController.text,
                      int.parse(priceController.text),
                    );
                    ref.invalidate(productsProvider);
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(message)));
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
