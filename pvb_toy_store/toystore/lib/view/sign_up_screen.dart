// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, duplicate_ignore, curly_braces_in_flow_control_structures, body_might_complete_normally_nullable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pvb_toy_app/network/user.dart';
import 'package:pvb_toy_app/view/login.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignUp();
}

// ignore: use_key_in_widget_constructors, must_be_immutable
class SignUp extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController conPassword = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text(
          "Sign Up",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 247, 182, 6),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          // width: double.infinity,
          child: Column(
            children: [
              const Text(
                "Register Account",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                  height: 1.5,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "* Required";
                    } else
                      return null;
                  },
                  controller: firstName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'First Name',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "* Required";
                    } else
                      return null;
                  },
                  controller: lastName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Last Name',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "* Required";
                    } else
                      return null;
                  },
                  controller: email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.mail),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "* Required";
                    } else
                      return null;
                  },
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.key),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "* Required";
                    }
                    if (value != password.text) {
                      return "Not match";
                    }
                    return null;
                  },
                  obscureText: true,
                  controller: conPassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm Password',
                    prefixIcon: Icon(Icons.key),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "* Required";
                    } else
                      return null;
                  },
                  controller: phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                    prefixIcon: Icon(Icons.phone_android),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "* Required";
                    }
                  },
                  controller: address,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Address',
                    prefixIcon: Icon(Icons.home),
                  ),
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                    // ignore: sort_child_properties_last
                    child: const Text(
                      'SignUp',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      // ignore: deprecated_member_use
                      primary: Colors.orange,
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // ignore: unused_local_variable
                        http.Response response = await register(
                            email.text,
                            password.text,
                            firstName.text,
                            lastName.text,
                            address.text,
                            phone.text);

                        final body = json.decode(response.body);
                        debugPrint(response.body);
                        if (body['status'] == 'Success') {
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Register Success!!'),
                              action: SnackBarAction(
                                label: 'OK',
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Login(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                          // ignore: use_build_context_synchronously

                        }
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
