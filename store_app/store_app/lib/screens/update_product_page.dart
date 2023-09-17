import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/controllers/products_controller.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = 'UpdateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image;

  String? price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 140),
                CustomTextField(
                  hintText: 'Product Name',
                  onChanged: (data) {
                    productName = data;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: 'Description',
                  onChanged: (data) {
                    desc = data;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: 'Price',
                  keyboardType: TextInputType.number,
                  onChanged: (data) {
                    price = data;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: 'Image',
                  onChanged: (data) {
                    image = data;
                  },
                ),
                const SizedBox(height: 30),
                CustomButton(
                  text: "Update",
                  onPressed: () async {
                    isLoading = true;
                    setState(() {});

                    try {
                      await updateProduct(product);
                      log('success');
                    } on Exception catch (e) {
                      log(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await ProductsController().updateProduct(
        id: product.id.toString(),
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        desc: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
