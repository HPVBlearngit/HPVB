// ignore_for_file: camel_case_types, prefer_collection_literals, unnecessary_new, unnecessary_this

class myToken {
  String? status;
  String? token1;

  
  myToken(this.token1, {this.status});

  myToken.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token1 = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['token'] = this.token1;
    return data;
  }
}
