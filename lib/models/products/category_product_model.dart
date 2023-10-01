class ReturnCategory {
  String? name;
  String? icon;
  int? id;

  ReturnCategory({this.name, this.icon, this.id});

  ReturnCategory.fromJson(Map<String, dynamic> json) {
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
