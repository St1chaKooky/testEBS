import 'package:dio/dio.dart';
import 'package:test_ebs/models/catigories/response_catigories.dart';

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
