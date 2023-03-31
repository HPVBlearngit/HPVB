// ignore_for_file: camel_case_types, unnecessary_new, prefer_collection_literals, unnecessary_this, unnecessary_question_mark, prefer_void_to_null

class myToy {
  int? id;
  String? name;
  String? description;
  double? price;
  int? qtyInStock;
  String? createAt;
  String? modifiedAt;
  Category? category;
  Brand? brand;
  Discount? discount;
  List<ToyImage>? toyImage;
  String? sku;

  myToy(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.qtyInStock,
      this.createAt,
      this.modifiedAt,
      this.category,
      this.brand,
      this.discount,
      this.toyImage,
      this.sku});

  myToy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    qtyInStock = json['qtyInStock'];
    createAt = json['createAt'];
    modifiedAt = json['modifiedAt'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    discount = json['discount'] != null
        ? new Discount.fromJson(json['discount'])
        : null;
    if (json['toyImage'] != null) {
      toyImage = <ToyImage>[];
      json['toyImage'].forEach((v) {
        toyImage!.add(new ToyImage.fromJson(v));
      });
    }
    sku = json['sku'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price as double;
    data['qtyInStock'] = this.qtyInStock;
    data['createAt'] = this.createAt;
    data['modifiedAt'] = this.modifiedAt;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.discount != null) {
      data['discount'] = this.discount!.toJson();
    }
    if (this.toyImage != null) {
      data['toyImage'] = this.toyImage!.map((v) => v.toJson()).toList();
    }
    data['sku'] = this.sku;
    return data;
  }
}

class Category {
  int? id;
  String? category;
  Null? description;
  String? catImg;

  Category({this.id, this.category, this.description, this.catImg});

  Category.fromJson(Map<String, dynamic> json) {
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

class Brand {
  int? id;
  String? brand;

  Brand({this.id, this.brand});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brand'] = this.brand;
    return data;
  }
}

class Discount {
  int? id;
  String? name;
  int? percent;
  String? description;
  Null? createAt;
  Null? modifiedAt;

  Discount(
      {this.id,
      this.name,
      this.percent,
      this.description,
      this.createAt,
      this.modifiedAt});

  Discount.fromJson(Map<String, dynamic> json) {
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

class ToyImage {
  int? id;
  String? url;
  int? toyId;

  ToyImage({this.id, this.url, this.toyId});

  ToyImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    toyId = json['toyId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['toyId'] = this.toyId;
    return data;
  }
}