import 'package:test_ebs/models/products/product_model.dart';

class ResponseProduct {
  int? count;
  String? next;
  String? previous;
  List<RetrieveProduct>? results;

  ResponseProduct({this.count, this.next, this.previous, this.results});

  ResponseProduct.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <RetrieveProduct>[];
      json['results'].forEach((v) {
        results!.add(new RetrieveProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
