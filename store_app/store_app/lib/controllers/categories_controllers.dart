import 'package:store_app/controllers/api_helper.dart';

class CategoriesControllers {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data =
        await ApiHelper().getRequest(path: "products/categories");

    return data;
  }
}
