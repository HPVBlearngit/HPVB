// ignore_for_file: camel_case_types, unnecessary_new, prefer_collection_literals, unnecessary_this

class cart {
  List<CartItems>? cartItems;
  double? totalPrice;

  cart({this.cartItems, this.totalPrice});

  cart.fromJson(Map<String, dynamic> json) {
    if (json['cartItems'] != null) {
      cartItems = <CartItems>[];
      json['cartItems'].forEach((v) {
        cartItems!.add(new CartItems.fromJson(v));
      });
    }
    totalPrice = json['totalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cartItems != null) {
      data['cartItems'] = this.cartItems!.map((v) => v.toJson()).toList();
    }
    data['totalPrice'] = this.totalPrice;
    return data;
  }
}

class CartItems {
  int? id;
  int? qty;
  Toy? toy;
  String? toyimages;

  CartItems({this.id, this.qty, this.toy, this.toyimages});

  CartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    qty = json['qty'];
    toy = json['toy'] != null ? new Toy.fromJson(json['toy']) : null;
    toyimages = json['toyimages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['qty'] = this.qty;
    if (this.toy != null) {
      data['toy'] = this.toy!.toJson();
    }
    data['toyimages'] = this.toyimages;
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
  String? sku;

  Toy(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.qtyInStock,
      this.createAt,
      this.modifiedAt,
      this.sku});

  Toy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    qtyInStock = json['qtyInStock'];
    createAt = json['createAt'];
    modifiedAt = json['modifiedAt'];
    sku = json['sku'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['qtyInStock'] = this.qtyInStock;
    data['createAt'] = this.createAt;
    data['modifiedAt'] = this.modifiedAt;
    data['sku'] = this.sku;
    return data;
  }
}
