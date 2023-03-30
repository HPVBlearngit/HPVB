

// ignore_for_file: prefer_collection_literals

// ignore: camel_case_types
class myBrand {
  int? id;
  String? brand;

  myBrand({
    this.id,
    this.brand,
  });

  myBrand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['brand'] = brand;
    return data;
  }

  myBrand copyWith({
    int? id,
    String? brand,
  }) {
    return myBrand(
      id: id ?? this.id,
      brand: brand ?? this.brand,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    if(brand != null){
      result.addAll({'brand': brand});
    }
  
    return result;
  }

  factory myBrand.fromMap(Map<String, dynamic> map) {
    return myBrand(
      id: map['id']?.toInt(),
      brand: map['brand'],
    );
  }

 

  @override
  String toString() => 'myBrand(id: $id, brand: $brand)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is myBrand &&
      other.id == id &&
      other.brand == brand;
  }

  @override
  int get hashCode => id.hashCode ^ brand.hashCode;
}
