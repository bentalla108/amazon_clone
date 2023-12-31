import 'package:amazon_clone/constants/loader.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/admin/screen/add_product_screen.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:amazon_clone/features/account/widgets/single_product.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final AdminServices adminService = AdminServices();
  List<Product>? products;
  @override
  void initState() {
    super.initState();
    fetchAllProduct();
  }

  fetchAllProduct() async {
    products = await adminService.fetchAllProduct(context);
    setState(() {});
  }

  deleteProduct(Product product, int index) async {
    adminService.deleteProduct(
      context: context,
      product: product,
      onSucces: () {
        products!.removeAt(index);
        showSnackBar(context, 'Product deleted succesfuly...');
        setState(() {});
      },
    );
  }

  void navigateAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
            body: GridView.builder(
                itemCount: products!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  final productData = products![index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 140,
                          child: SingleProduct(
                            image: productData.images[0],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Text(
                                productData.name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                deleteProduct(productData, index);
                              },
                              icon: const Icon(
                                Icons.delete_outline,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
            floatingActionButton: FloatingActionButton(
              tooltip: 'Ajouter un produit',
              onPressed: navigateAddProduct,
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
