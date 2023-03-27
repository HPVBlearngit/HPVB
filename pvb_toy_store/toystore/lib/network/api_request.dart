import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:pvb_toy_app/const/api_const.dart';
import 'package:http/http.dart' as http;
import 'package:pvb_toy_app/model/brand.dart';
import 'package:pvb_toy_app/model/discount.dart';
import 'package:pvb_toy_app/model/product.dart';

import '../model/category.dart';

List<myDiscount> parseDiscount(String responseBody) {
  var l = json.decode(responseBody) as List<dynamic>;
  var discount = l.map((model) => myDiscount.fromJson(model)).toList();
  return discount;
}

Future<List<myDiscount>> fetchDiscount() async {
  final response = await http.get(Uri.parse('$mainUrl$discountUrl'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'});
  if (response.statusCode == 200)
    // ignore: curly_braces_in_flow_control_structures
    return compute(parseDiscount, response.body);
  else if (response.statusCode == 400)
    // ignore: curly_braces_in_flow_control_structures
    throw Exception("Not found");
  else
    // ignore: curly_braces_in_flow_control_structures
    throw Exception("Cannot get Brand!");
}

List<myBrand> parseBrand(String responseBody) {
  var l = json.decode(responseBody) as List<dynamic>;
  var brands = l.map((model) => myBrand.fromJson(model)).toList();
  return brands;
}

Future<List<myBrand>> fetchBrand() async {
  final response = await http.get(Uri.parse('$mainUrl$brandUrl'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'});
  if (response.statusCode == 200)
    // ignore: curly_braces_in_flow_control_structures
    return compute(parseBrand, response.body);
  else if (response.statusCode == 400)
    // ignore: curly_braces_in_flow_control_structures
    throw Exception("Not found");
  else
    // ignore: curly_braces_in_flow_control_structures
    throw Exception("Cannot get Brand!");
}

//product details
myToy parseProductDetail(String responseBody) {
  var l = json.decode(responseBody) as dynamic;
  var toys = myToy.fromJson(l);
  return toys;
}

Future<myToy> fetchProductById(id) async {
  final response = await http.get(Uri.parse('$mainUrl$productDetailUrl/$id'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'});
  if (response.statusCode == 200)
    // ignore: curly_braces_in_flow_control_structures
    return compute(parseProductDetail, response.body);
  else if (response.statusCode == 400)
    // ignore: curly_braces_in_flow_control_structures
    throw Exception("Not found");
  else
    // ignore: curly_braces_in_flow_control_structures
    throw Exception("Cannot get toy detail!");
}

//Category
List<myCategory> parseCategory(String responseBody) {
  var l = json.decode(responseBody) as List<dynamic>;
  var categories = l.map((model) => myCategory.fromJson(model)).toList();
  return categories;
}

Future<List<myCategory>> fetchCategory() async {
  final response = await http.get(Uri.parse('$mainUrl$categoryUrl'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'});
  if (response.statusCode == 200)
    // ignore: curly_braces_in_flow_control_structures
    return compute(parseCategory, response.body);
  else if (response.statusCode == 400)
    // ignore: curly_braces_in_flow_control_structures
    throw Exception("Not found");
  else
    // ignore: curly_braces_in_flow_control_structures
    throw Exception("Cannot get Category!");
}

//product

List<myToy> parseProduct(String responseBody) {
  var l = json.decode(responseBody) as List<dynamic>;
  var toys = l.map((model) => myToy.fromJson(model)).toList();
  return toys;
}

Future<List<myToy>> fetchProductByCategory(id) async {
  final response = await http.get(Uri.parse('$mainUrl$productUrl/$id'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'});
  if (response.statusCode == 200)
    // ignore: curly_braces_in_flow_control_structures
    return compute(parseProduct, response.body);
  else if (response.statusCode == 400)
    // ignore: curly_braces_in_flow_control_structures
    throw Exception("Not found");
  else
    // ignore: curly_braces_in_flow_control_structures
    throw Exception("Cannot get toy!");
}

Future<List<myToy>> fetchAllProduct() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8081/pvb/toy'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'});
  if (response.statusCode == 200)
    // ignore: curly_braces_in_flow_control_structures
    return compute(parseProduct, response.body);
  else if (response.statusCode == 400)
    // ignore: curly_braces_in_flow_control_structures
    throw Exception("Not found");
  else
    // ignore: curly_braces_in_flow_control_structures
    throw Exception("Cannot get toy!");
}

Future<List<myToy>> fetchProductByBrand(id) async {
  final response = await http.get(Uri.parse('$mainUrl$productBrandUrl/$id'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'});
  if (response.statusCode == 200)
    // ignore: curly_braces_in_flow_control_structures
    return compute(parseProduct, response.body);
  else if (response.statusCode == 400)
    // ignore: curly_braces_in_flow_control_structures
    throw Exception("Not found");
  else
    // ignore: curly_braces_in_flow_control_structures
    throw Exception("Cannot get toy!");
}

Future<List<myToy>> fetchProductByDiscount(id) async {
  final response = await http.get(Uri.parse('$mainUrl$productDiscountUrl/$id'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'});
  if (response.statusCode == 200)
    // ignore: curly_braces_in_flow_control_structures
    return compute(parseProduct, response.body);
  else if (response.statusCode == 400)
    // ignore: curly_braces_in_flow_control_structures
    throw Exception("Not found");
  else
    // ignore: curly_braces_in_flow_control_structures
    throw Exception("Cannot get toy!");
}
