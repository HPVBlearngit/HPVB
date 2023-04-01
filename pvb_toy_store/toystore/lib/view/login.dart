// ignore_for_file: use_build_context_synchronously, unnecessary_string_interpolations, prefer_const_constructors, sort_child_properties_last, duplicate_ignore, deprecated_member_use, avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
// import 'package:flutterdemo/viewuser.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'package:pvb_toy_app/view/admin.dart';
import 'package:pvb_toy_app/view/cart_detail.dart';
import 'package:pvb_toy_app/view/order_history.dart';
import 'package:pvb_toy_app/view/product_brand_view.dart';
import 'package:pvb_toy_app/view/product_detail_view.dart';
import 'package:pvb_toy_app/view/product_discount_view.dart';
import 'package:pvb_toy_app/view/product_list_view.dart';
import 'package:pvb_toy_app/view/sign_up_screen.dart';
import 'package:pvb_toy_app/view/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
import '../main.dart';
import '../network/user.dart';
import 'Check_out.dart';
import 'Order_Detail.dart';

// import 'getdata.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  static const String _title = 'Login';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/productList':
            return PageTransition(
                type: PageTransitionType.fade,
                child: ProductListPage(),
                settings: settings);
          case '/home':
            return PageTransition(
                type: PageTransitionType.fade,
                child: MyHomePage(),
                settings: settings);
          case '/productDetail':
            return PageTransition(
                type: PageTransitionType.fade,
                child: ProductDetailPage(),
                settings: settings);
          case '/cartDetail':
            return PageTransition(
                type: PageTransitionType.fade,
                child: CartDetail(),
                settings: settings);
          case '/producBrandList':
            return PageTransition(
                type: PageTransitionType.fade,
                child: ProductBrandListPage(),
                settings: settings);
          case '/producDiscountList':
            return PageTransition(
                type: PageTransitionType.fade,
                child: ProductDiscountListPage(),
                settings: settings);
          case '/login':
            return PageTransition(
                type: PageTransitionType.fade,
                // ignore: prefer_const_constructors
                child: Login(),
                settings: settings);
          case '/userDetail':
            return PageTransition(
                type: PageTransitionType.fade,
                child: UserProfile(),
                settings: settings);
          case '/register':
            return PageTransition(
                type: PageTransitionType.fade,
                child: SignUpScreen(),
                settings: settings);
          case '/checkOut':
            return PageTransition(
                type: PageTransitionType.fade,
                child: CheckOut(),
                settings: settings);
          case '/orders':
            return PageTransition(
                type: PageTransitionType.fade,
                child: OrderHistory(),
                settings: settings);
          case '/orderDetail':
            return PageTransition(
                type: PageTransitionType.fade,
                child: OrderDetail(),
                settings: settings);
          case '/adminPage':
            return PageTransition(
                type: PageTransitionType.fade,
                child: AdminPage(),
                settings: settings);
          default:
            return null;
        }
      },
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            _title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.orange,
        ),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? token = '';
  Future getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString('token');
    });
  }

  @override
  void initState() {
    super.initState();
    getToken();

    nameController = TextEditingController(text: 'vbao964@gmail.com');
    passwordController = TextEditingController(text: 'quocbao1123');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'PvBTOYS',
                  style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),
            // TextButton(
            //   onPressed: () {
            //     //forgot password screen
            //   },
            //   child: const Text(
            //     'Forgot Password',
            //   ),
            // ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                  ),
                  onPressed: () async {
                    http.Response response = await login(
                        nameController.text, passwordController.text);
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    final body = json.decode(response.body);
                    debugPrint(response.body);

                    if (nameController.text == "") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Email cannot be blank'),
                          action: SnackBarAction(
                            label: 'OK',
                            onPressed: () {
                              // Code to execute.
                            },
                          ),
                        ),
                      );
                    } else {
                      if (passwordController.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Password cannot be blank'),
                            action: SnackBarAction(
                              label: 'OK',
                              onPressed: () {
                                // Code to execute.
                              },
                            ),
                          ),
                        );
                      }
                    }

                    if (body['role'] == 'admin' &&
                        body['status'] == 'success') {
                      pref.setString('role', body['role']);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Welcome Admin'),
                          action: SnackBarAction(
                            label: 'OK',
                            onPressed: () {
                              Navigator.of(context).pushNamed('/adminPage');
                            },
                          ),
                        ),
                      );
                    } else {
                      if (body['status'] == 'success') {
                        pref.setString('token', body['token']);
                        token = pref.getString('token');
                        debugPrint('$token');

                        Navigator.of(context).pushNamed('/home');
                      } else {
                        if (body['status'] == 'failed Email') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('User not valid!'),
                              action: SnackBarAction(
                                label: 'OK',
                                onPressed: () {
                                  // Code to execute.
                                },
                              ),
                            ),
                          );
                        } else {
                          if (body['status'] == 'failed Password') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Wrong password!'),
                                action: SnackBarAction(
                                  label: 'OK',
                                  onPressed: () {
                                    // Code to execute.
                                  },
                                ),
                              ),
                            );
                          }
                        }
                      }
                    }

                    // ignore: unnecessary_null_comparison
                  },
                )),
            Row(
              // ignore: sort_child_properties_last
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.orange,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/register');
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}
