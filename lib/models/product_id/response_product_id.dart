class ResponseProductId {
  Category? category;
  String? name;
  String? details;
  String? size;
  String? colour;
  double? price;
  int? id;
  String? mainImage;
  List<Images>? images;
  List<Reviews>? reviews;

  ResponseProductId(
      {this.category,
      this.name,
      this.details,
      this.size,
      this.colour,
      this.price,
      this.id,
      this.mainImage,
      this.images,
      this.reviews});

  ResponseProductId.fromJson(Map<String, dynamic> json) {
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    name = json['name'];
    details = json['details'];
    size = json['size'];
    colour = json['colour'];
    price = json['price'];
    id = json['id'];
    mainImage = json['main_image'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['name'] = name;
    data['details'] = details;
    data['size'] = size;
    data['colour'] = colour;
    data['price'] = price;
    data['id'] = id;
    data['main_image'] = mainImage;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
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

class Images {
  String? image;

  Images({this.image});

  Images.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    return data;
  }
}

class Reviews {
  int? id;
  String? modifiedAt;
  String? createdAt;
  String? firstName;
  String? lastName;
  String? image;
  int? rating;
  String? message;

  Reviews(
      {this.id,
      this.modifiedAt,
      this.createdAt,
      this.firstName,
      this.lastName,
      this.image,
      this.rating,
      this.message});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    modifiedAt = json['modified_at'];
    createdAt = json['created_at'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    image = json['image'];
    rating = json['rating'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['modified_at'] = this.modifiedAt;
    data['created_at'] = this.createdAt;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['image'] = this.image;
    data['rating'] = this.rating;
    data['message'] = this.message;
    return data;
  }
}
