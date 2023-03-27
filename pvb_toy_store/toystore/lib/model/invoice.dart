// ignore_for_file: camel_case_types, prefer_void_to_null, unnecessary_question_mark

class myInvoice {
  int? id;
  double? total;
  String? createAt;
  User? user;
  bool? paid;
  bool? delivery;
  List<InvoiceDetail>? invoiceDetail;

  myInvoice(
      {this.id,
      this.total,
      this.createAt,
      this.user,
      this.paid,
      this.delivery,
      this.invoiceDetail});

  myInvoice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    createAt = json['createAt'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    paid = json['paid'];
    delivery = json['delivery'];
    if (json['invoiceDetail'] != null) {
      invoiceDetail = <InvoiceDetail>[];
      json['invoiceDetail'].forEach((v) {
        invoiceDetail!.add(InvoiceDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['total'] = total;
    data['createAt'] = createAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['paid'] = paid;
    data['delivery'] = delivery;
    if (invoiceDetail != null) {
      data['invoiceDetail'] = invoiceDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? password;
  String? lastname;
  String? profilePicture;
  String? phone;
  String? address;
  String? firstName;

  User(
      {this.id,
      this.email,
      this.password,
      this.lastname,
      this.profilePicture,
      this.phone,
      this.address,
      this.firstName});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    lastname = json['lastname'];
    profilePicture = json['profilePicture'];
    phone = json['phone'];
    address = json['address'];
    firstName = json['firstName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['password'] = password;
    data['lastname'] = lastname;
    data['profilePicture'] = profilePicture;
    data['phone'] = phone;
    data['address'] = address;
    data['firstName'] = firstName;
    return data;
  }
}

class InvoiceDetail {
  int? invoiceId;
  Toy? toy;
  int? quantity;

  InvoiceDetail({this.invoiceId, this.toy, this.quantity});

  InvoiceDetail.fromJson(Map<String, dynamic> json) {
    invoiceId = json['invoiceId'];
    toy = json['toy'] != null ? Toy.fromJson(json['toy']) : null;
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['invoiceId'] = invoiceId;
    if (toy != null) {
      data['toy'] = toy!.toJson();
    }
    data['quantity'] = quantity;
    return data;
  }
}

class Toy {
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

  Toy(
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

  Toy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    qtyInStock = json['qtyInStock'];
    createAt = json['createAt'];
    modifiedAt = json['modifiedAt'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    discount =
        json['discount'] != null ? Discount.fromJson(json['discount']) : null;
    if (json['toyImage'] != null) {
      toyImage = <ToyImage>[];
      json['toyImage'].forEach((v) {
        toyImage!.add(ToyImage.fromJson(v));
      });
    }
    sku = json['sku'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['qtyInStock'] = qtyInStock;
    data['createAt'] = createAt;
    data['modifiedAt'] = modifiedAt;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    if (discount != null) {
      data['discount'] = discount!.toJson();
    }
    if (toyImage != null) {
      data['toyImage'] = toyImage!.map((v) => v.toJson()).toList();
    }
    data['sku'] = sku;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['description'] = description;
    data['catImg'] = catImg;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['brand'] = brand;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['percent'] = percent;
    data['description'] = description;
    data['createAt'] = createAt;
    data['modifiedAt'] = modifiedAt;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['toyId'] = toyId;
    return data;
  }
}
