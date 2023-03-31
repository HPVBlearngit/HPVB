// ignore_for_file: unnecessary_string_interpolations

import 'dart:convert';

// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pvb_toy_app/const/api_const.dart';
import 'package:pvb_toy_app/model/cart.dart';

import '../model/invoice.dart';
// ignore: unused_import

//delete cart
Future<http.Response> deleteCart(String id, String? token) async {
  final http.Response response = await http.delete(
    Uri.parse('$mainUrl$cartUrl/delete/$id?token=$token'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  return response;
}

Future<http.Response> deleteAllCart(String? token) async {
  final http.Response response = await http.delete(
    Uri.parse('$mainUrl$cartUrl/?token=$token'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  return response;
}

Future<http.Response> updateCart(
    String id, String toyId, String qty, String? token) async {
  Map data = {'toyId': toyId, 'qty': qty};
  var body = json.encode(data);
  final http.Response response =
      await http.put(Uri.parse('$mainUrl$cartUrl/$id?token=$token'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);

  return response;
}

Future<http.Response> updateInvoiceState(
     id,  isDelivery) async {
  Map data = { 'isDelivery': isDelivery};
  var body = json.encode(data);
  final http.Response response =
      await http.put(Uri.parse('$mainUrl$invoiceUrl/$id'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);

  return response;
}

//add to cart
Future<http.Response> createCart(
    String toyId, String qty, String? token) async {
  var url = '$mainUrl$cartUrl?token=$token';

  Map data = {'toyId': toyId, 'qty': qty};
  //encode Map to JSON
  var body = json.encode(data);

  var response = await http.post(Uri.parse(url),
      headers: {"Content-Type": "application/json"}, body: body);
  return response;
}

Future<http.Response> createInvoice(String? token) async {
  var url = '$mainUrl$invoiceUrl?token=$token';

  var response = await http
      .post(Uri.parse(url), headers: {"Content-Type": "application/json"});
  return response;
}

//get cart
Future<cart> fetchCart(String? token) async {
  final response = await http.get(Uri.parse('$mainUrl$cartUrl?token=$token'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return cart.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Cart');
  }
}

//product

List<myInvoice> parseInvoice(String responseBody) {
  var l = json.decode(responseBody) as List<dynamic>;
  var invoices = l.map((model) => myInvoice.fromJson(model)).toList();
  return invoices;
}

Future<List<myInvoice>> fetchInvoice(String? token, int state) async {
  final response = await http.get(
      Uri.parse('$mainUrl$invoiceUrl/$state?token=$token'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'});
  if (response.statusCode == 200)
    // ignore: curly_braces_in_flow_control_structures
    return compute(parseInvoice, response.body);
  else if (response.statusCode == 400)
    // ignore: curly_braces_in_flow_control_structures
    throw Exception("Not found");
  else
    // ignore: curly_braces_in_flow_control_structures
    throw Exception("Cannot get Invoice!");
}

Future<List<myInvoice>> fetchAllInvoice(int state) async {
  final response = await http.get(Uri.parse('$mainUrl$invoiceUrl/all/$state'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'});
  if (response.statusCode == 200)
    // ignore: curly_braces_in_flow_control_structures
    return compute(parseInvoice, response.body);
  else if (response.statusCode == 400)
    // ignore: curly_braces_in_flow_control_structures
    throw Exception("Not found");
  else
    // ignore: curly_braces_in_flow_control_structures
    throw Exception("Cannot get Invoice!");
}

Future<List<myInvoice>> fetchInvoiceByuser(String? token) async {
  final response = await http.get(Uri.parse('$mainUrl$invoiceUrl?token=$token'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'});
  if (response.statusCode == 200)
    // ignore: curly_braces_in_flow_control_structures
    return compute(parseInvoice, response.body);
  else if (response.statusCode == 400)
    // ignore: curly_braces_in_flow_control_structures
    throw Exception("Not found");
  else
    // ignore: curly_braces_in_flow_control_structures
    throw Exception("Cannot get Invoice!");
}
