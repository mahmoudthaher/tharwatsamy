import 'package:store_app/controllers/api_helper.dart';
import 'package:store_app/models/product_model.dart';

class ProductsController {
  Future<List<ProductModel>> getAllProducts() async {
    try {
      dynamic jsonOpject = await ApiHelper().getRequest(path: "products");
      List<ProductModel> productList = [];
      jsonOpject.forEach((v) => {productList.add(ProductModel.fromJson(v))});
      return productList;
    } catch (ex) {
      rethrow;
    }
  }

  Future<List<ProductModel>> getCategoriesProducts(
      {required String categoryName}) async {
    List<dynamic> jsonOpject =
        await ApiHelper().getRequest(path: "products/categories/$categoryName");
    List<ProductModel> productList = [];
    for (var v in jsonOpject) {
      productList.add(ProductModel.fromJson(v));
    }
    return productList;
  }

  Future<ProductModel> createProduct(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required String category}) async {
    try {
      Map<String, dynamic> data =
          await ApiHelper().postRequest(path: "products", body: {
        'title': title,
        'price': price,
        'description': desc,
        'image': image,
        'category': category
      });
      return ProductModel.fromJson(data);
    } catch (ex) {
      rethrow;
    }
  }

  Future<ProductModel> updateProduct(
      {required String id,
      required String title,
      required String price,
      required String desc,
      required String image,
      required String category}) async {
    try {
      Map<String, dynamic> data =
          await ApiHelper().putRequest(path: "products/$id", body: {
        'title': title,
        'price': price,
        'description': desc,
        'image': image,
        'category': category
      });
      return ProductModel.fromJson(data);
    } catch (ex) {
      rethrow;
    }
  }
  // Future<void> deleteProduct(int id) async {
  //   try {
  //     await ApiHelper().deleteRequest(
  //       "products/$id",
  //     );
  //   } catch (ex) {
  //     rethrow;
  //   }
  // }
}
