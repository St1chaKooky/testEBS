import 'package:dio/dio.dart';
import 'package:test_ebs/models/catigories/response_catigories_model.dart';
import 'package:test_ebs/models/products/response_product_model.dart';

class ApiCategories {
  final Dio dio = Dio();
  String url = 'http://mobile-shop-api.hiring.devebs.net/categories';
  Future<ResponseCatigories> getCategories() async {
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      try {
        final responseData = response.data;
        final categories = ResponseCatigories.fromJson(responseData);
        return categories;
      } catch (err) {
        print('Err ApiCategory ${err}');
      }
    } else {
      print('Ну ошибка тип');
    }
    return ResponseCatigories();
  }
}

class ApiProduct {
  final Dio dio = Dio();
  String url = 'http://mobile-shop-api.hiring.devebs.net/products';
  Future<ResponseProduct> getProduct() async {
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      try {
        final responseData = response.data;
        final products = ResponseProduct.fromJson(responseData);
        print(products.count);
        return products;
      } catch (err) {
        print('Err ApiProduct${err}');
      }
    } else {
      print('Ну ошибка тип');
    }

    return ResponseProduct();
  }
}
