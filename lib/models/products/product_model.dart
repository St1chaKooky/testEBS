import 'package:test_ebs/models/products/category_product_model.dart';

class RetrieveProduct {
  ReturnCategory? category;
  String? name;
  String? details;
  String? size;
  String? colour;
  double? price;
  String? mainImage;
  int? id;

  RetrieveProduct(
      {this.category,
      this.name,
      this.details,
      this.size,
      this.colour,
      this.price,
      this.mainImage,
      this.id});

  RetrieveProduct.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? new ReturnCategory.fromJson(json['category'])
        : null;
    name = json['name'];
    details = json['details'];
    size = json['size'];
    colour = json['colour'];
    price = json['price'];
    mainImage = json['main_image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['name'] = this.name;
    data['details'] = this.details;
    data['size'] = this.size;
    data['colour'] = this.colour;
    data['price'] = this.price;
    data['main_image'] = this.mainImage;
    data['id'] = this.id;
    return data;
  }
}
