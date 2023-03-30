// ignore_for_file: camel_case_types, unnecessary_new, prefer_collection_literals, unnecessary_this

class myCategory {
  int? id;
  String? category;
  String? description;
  String? catImg;

  myCategory({this.id, this.category, this.description, this.catImg});

  myCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    description = json['description'];
    catImg = json['catImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['description'] = this.description;
    data['catImg'] = this.catImg;
    return data;
  }
}
