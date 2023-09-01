import 'dart:io';
import 'package:amazon_clone/models/product.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:flutter/material.dart';

class AdminService {
  Future<void> sellProduct({
    required BuildContext context,
    required String name,
    required double price,
    required double quantity,
    required String description,
    required String categoy,
    required List<File> images,
  }) async {
    try {
      final cloudinary = CloudinaryPublic('dx5xmloy8', 'iiek45cj');
      List<String> imageUrl = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse cloudResponse = await cloudinary
            .uploadFile(CloudinaryFile.fromFile(images[i].path, folder: name));
        imageUrl.add(cloudResponse.secureUrl);
      }

      Product product = Product(
          name: name,
          description: description,
          price: price,
          quantity: quantity,
          images: imageUrl);
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.toString());
      }
    }
    ;
  }
}
