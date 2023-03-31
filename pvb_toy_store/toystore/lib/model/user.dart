// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_new, prefer_collection_literals, unnecessary_this
import 'dart:convert';

// ignore: camel_case_types
class myUser {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phone;
  String? address;
  String? profilePicture;
  Role? role;
  myUser({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phone,
    this.address,
    this.profilePicture,
    this.role,
  });

  myUser copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? phone,
    String? address,
    String? profilePicture,
    Role? role,
  }) {
    return myUser(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      profilePicture: profilePicture ?? this.profilePicture,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'phone': phone,
      'address': address,
      'profilePicture': profilePicture,
      'role': role?.toMap(),
    };
  }

  factory myUser.fromMap(Map<String, dynamic> map) {
    return myUser(
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      profilePicture: map['profilePicture'] != null ? map['profilePicture'] as String : null,
      role: map['role'] != null ? Role.fromMap(map['role'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory myUser.fromJson(String source) =>
      myUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'myUser(firstName: $firstName, lastName: $lastName, email: $email, password: $password, phone: $phone, address: $address, profilePicture: $profilePicture, role: $role)';
  }

  @override
  bool operator ==(covariant myUser other) {
    if (identical(this, other)) return true;
  
    return 
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.email == email &&
      other.password == password &&
      other.phone == phone &&
      other.address == address &&
      other.profilePicture == profilePicture &&
      other.role == role;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
      lastName.hashCode ^
      email.hashCode ^
      password.hashCode ^
      phone.hashCode ^
      address.hashCode ^
      profilePicture.hashCode ^
      role.hashCode;
  }
}

class Role {
  int? id;
  String? role;
  Role({
    this.id,
    this.role,
  });

  Role copyWith({
    int? id,
    String? role,
  }) {
    return Role(
      id: id ?? this.id,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'role': role,
    };
  }

  factory Role.fromMap(Map<String, dynamic> map) {
    return Role(
      id: map['id'] != null ? map['id'] as int : null,
      role: map['role'] != null ? map['role'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Role.fromJson(String source) => Role.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Role(id: $id, role: $role)';

  @override
  bool operator ==(covariant Role other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.role == role;
  }

  @override
  int get hashCode => id.hashCode ^ role.hashCode;
}
