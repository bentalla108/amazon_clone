import 'dart:io';

import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];

  List<File> imageSelected = [];

  void selectImage() async {
    var res = await pickImages();

    setState(() {
      imageSelected = res;
    });
  }

  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() &&
        imageSelected.isNotEmpty) {
      adminServices.sellProduct(
          context: context,
          name: productNameController.text,
          price: double.parse(priceController.text),
          quantity: double.parse(quantityController.text),
          description: descriptionController.text,
          category: category,
          images: imageSelected);
    }
  }

  final TextEditingController productNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final AdminServices adminServices = AdminServices();
  final _addProductFormKey = GlobalKey<FormState>();

  String category = 'Mobiles';
  @override
  void dispose() {
    quantityController.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: const Text(
            'Ajouter un produit',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addProductFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                imageSelected.isNotEmpty
                    ? CarouselSlider(
                        items: imageSelected.map((e) {
                          return Builder(builder: (BuildContext context) {
                            return Image.file(
                              e,
                              fit: BoxFit.cover,
                              height: 200,
                            );
                          });
                        }).toList(),
                        options:
                            CarouselOptions(viewportFraction: 1, height: 200),
                      )
                    : InkWell(
                        onTap: selectImage,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          strokeCap: StrokeCap.round,
                          dashPattern: const [10, 4],
                          child: SizedBox(
                            width: double.infinity,
                            height: 150,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.folder_open,
                                    size: 40,
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    'Selectionnez l\'image du produit',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey.shade400),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                    controller: productNameController,
                    hintText: 'Product Name'),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: descriptionController,
                    hintText: 'Product Description',
                    maxLines: 7),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: priceController,
                    hintText: 'Price',
                    keyboard: TextInputType.number),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: quantityController,
                    hintText: 'Quantity',
                    keyboard: TextInputType.number),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    onChanged: (String? newVal) {
                      setState(() {
                        category = newVal!;
                      });
                    },
                    value: category,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: productCategories.map((String e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e.toUpperCase()),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  text: 'Vendre',
                  onTap: sellProduct,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
