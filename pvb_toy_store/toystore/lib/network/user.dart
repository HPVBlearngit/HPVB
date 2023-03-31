
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pvb_toy_app/model/user.dart';

import '../const/api_const.dart';

Future<http.Response> login(String username, String password) async {
  return http.post(
    Uri.parse('$mainUrl$userUrl$loginUrl'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'email': username, 'password': password}),
  );
}

Future<http.Response> register(String username, String password,
    String firstName, String lastName, String address, String phone) async {
  return http.post(
    Uri.parse('$mainUrl$userUrl$registerUrl'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': username,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'address': address,
      'phone': phone
    }),
  );
}

Future<myUser> fetchUser(String? token) async {
  final response = await http.get(Uri.parse('$mainUrl$userUrl?token=$token'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return myUser.fromJson(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load user');
  }
}

// myAdmin parseAdmin(String responseBody) {
//   var l = json.decode(responseBody) as dynamic;
//   var admin = myAdmin.fromJson(l);
//   return admin;
// }

// Future<myAdmin> fetchProductById(String? token) async {
//   final response = await http.get(Uri.parse('$mainUrl$userUrl?token=$token'),
//       headers: {'Content-Type': 'application/json; charset=UTF-8'});
//   if (response.statusCode == 200)
//     // ignore: curly_braces_in_flow_control_structures
//     return compute(parseAdmin, response.body);
//   else if (response.statusCode == 400)
//     // ignore: curly_braces_in_flow_control_structures
//     throw Exception("Not found");
//   else
//     // ignore: curly_braces_in_flow_control_structures
//     throw Exception("Cannot get toy detail!");
// }
