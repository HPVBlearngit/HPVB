// ignore_for_file: camel_case_types, unnecessary_question_mark, unnecessary_new, prefer_collection_literals, unnecessary_this

class myDiscount {
  int? id;
  String? name;
  int? percent;
  String? description;
  // ignore: prefer_void_to_null
  Null? createAt;
  // ignore: prefer_void_to_null
  Null? modifiedAt;

  myDiscount(
      {this.id,
      this.name,
      this.percent,
      this.description,
      this.createAt,
      this.modifiedAt});

  myDiscount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    percent = json['percent'];
    description = json['description'];
    createAt = json['createAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['percent'] = this.percent;
    data['description'] = this.description;
    data['createAt'] = this.createAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
