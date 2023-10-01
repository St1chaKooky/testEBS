import 'package:dio/dio.dart';
import 'package:test_ebs/models/best_sold_products/response_products.dart';
import 'package:test_ebs/models/catigories/response_catigories_model.dart';
import 'package:test_ebs/models/product_id/response_product_id.dart';
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

class ApiBestProduct {
  final Dio dio = Dio();
  String url =
      'http://mobile-shop-api.hiring.devebs.net/products/best-sold-products';
  Future<List<int>> getProduct() async {
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      try {
        final responseData = response.data;
        final products = ResponseBestProducts.fromJson(responseData);
        final results = products.results;
        final List<int> list = [];
        for (int i = 0; i < results!.length; i++) {
          int id = results[i].id!;
          list.add(id);
        }
        return list;
      } catch (err) {
        print('Err ApiBestProduct${err}');
      }
    } else {
      print('Ну ошибка тип');
    }

    return [];
  }
}

class ApiIdBestProduct {
  List listId;
  Dio dio = Dio();

  ApiIdBestProduct({required this.listId});

  Future<List<ResponseProductId>> getProduct() async {
    List<ResponseProductId> products = [];
    for (int i = 0; i < listId.length; i++) {
      int idd = listId[i];
      String url = 'http://mobile-shop-api.hiring.devebs.net/products/$idd';
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final responseData = response.data;
        final product = ResponseProductId.fromJson(responseData);
        products.add(product);
      }
    }
    print(products);
    return products;
  }
}

class ApiIdProduct {
  int id;
  Dio dio = Dio();

  ApiIdProduct({required this.id});

  Future<ResponseProductId> getProduct() async {
    try {
      String url = 'http://mobile-shop-api.hiring.devebs.net/products/$id';
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final responseData = response.data;
        final product = ResponseProductId.fromJson(responseData);
        return product;
      }
    } catch (err) {
      print('Error ApiIdProduct ${err}');
    }
    return ResponseProductId();
  }
}
