import 'package:test_ebs/models/best_sold_products/product_model.dart';

class ResponseBestProducts {
  int? count;
  int? totalPages;
  int? perPage;
  int? currentPage;
  List<BestProduct>? results;

  ResponseBestProducts(
      {this.count,
      this.totalPages,
      this.perPage,
      this.currentPage,
      this.results});

  ResponseBestProducts.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    totalPages = json['total_pages'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    if (json['results'] != null) {
      results = <BestProduct>[];
      json['results'].forEach((v) {
        results!.add(new BestProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['total_pages'] = this.totalPages;
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
