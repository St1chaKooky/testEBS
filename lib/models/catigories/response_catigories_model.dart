import 'package:test_ebs/models/catigories/category_model.dart';

class ResponseCatigories {
  int? count;
  String? next;
  String? previous;
  List<Category>? results;

  ResponseCatigories({this.count, this.next, this.previous, this.results});

  ResponseCatigories.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Category>[];
      json['results'].forEach((v) {
        results!.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
