import 'package:flutter/material.dart';
import 'package:homework/controllers/products_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final productsController = ProductsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Home Screen'),
      ),
      body: FutureBuilder(
          future: productsController.getProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text('Malumotlar mavjud emas'),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            final products = snapshot.data;
            return products == null || products.isEmpty
                ? const Center(
                    child: Text('mahsulotlar mavjud emas'),
                  )
                : ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (ctx, index) {
                      final product = products[index];
                      return ListTile(
                        title: Text(product.title),
                        subtitle: Text('${product.price}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          ],
                        ),
                      );
                    });
          }),
    );
  }
}
