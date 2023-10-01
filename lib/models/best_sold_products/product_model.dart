import 'package:test_ebs/models/products/category_product_model.dart';

class BestProduct {
  ReturnCategory? category;
  String? name;
  String? details;
  String? size;
  String? colour;
  double? price;
  int? soldCount;
  int? id;

  BestProduct(Future<List<int>> product,
      {this.category,
      this.name,
      this.details,
      this.size,
      this.colour,
      this.price,
      this.soldCount,
      this.id});

  BestProduct.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? ReturnCategory.fromJson(json['category'])
        : null;
    name = json['name'];
    details = json['details'];
    size = json['size'];
    colour = json['colour'];
    price = json['price'];
    soldCount = json['sold_count'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['name'] = name;
    data['details'] = details;
    data['size'] = size;
    data['colour'] = colour;
    data['price'] = price;
    data['sold_count'] = soldCount;
    data['id'] = id;
    return data;
  }
}
