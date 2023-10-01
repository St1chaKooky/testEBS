class Product {
  int? count;
  String? next;
  String? previous;
  List<Results>? results;

  Product({this.count, this.next, this.previous, this.results});

  Product.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
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

class Results {
  Category? category;
  String? name;
  String? details;
  String? size;
  String? colour;
  int? price;
  String? mainImage;
  int? id;

  Results(
      {this.category,
      this.name,
      this.details,
      this.size,
      this.colour,
      this.price,
      this.mainImage,
      this.id});

  Results.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
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

class Category {
  String? name;
  String? icon;
  int? id;

  Category({this.name, this.icon, this.id});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['id'] = this.id;
    return data;
  }
}