//ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps, file_names

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:progress_dialog/progress_dialog.dart';
// ignore: unused_import
import 'package:pvb_toy_app/model/cart.dart';
import 'package:pvb_toy_app/model/payment.dart';
import 'package:pvb_toy_app/network/api_cart_request.dart';
import 'package:pvb_toy_app/network/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: use_key_in_widget_constructors
class CheckOut extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CheckOutState();
}

class CheckOutState extends State<CheckOut> {
  final RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
  String? token = "";
  bool isLoadFromServer = false;
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController address = TextEditingController();

  @override
  void initState() {
    super.initState();
    StripeServices.init();
    fetchCart(token);
    getToken();
  }

  void getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString('token');
    });
  }

  void payWithCard(String amount) async {
    ProgressDialog dialog = ProgressDialog(context);
    dialog.style(message: 'please wait..........');
    await dialog.show();
    var response =
        await StripeServices.payNowHandler(amount: amount, currency: 'VND');
    await dialog.hide();
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(response.message),
      duration: Duration(milliseconds: response.success == true ? 1200 : 3000),
    ));
    if (response.success == true) {
      setState(() {
        createInvoice(token);
        deleteAllCart(token);
        Navigator.pop(context, 'Go Back');
        Navigator.pushNamed(context, '/home');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0),
      appBar: AppBar(
        title: Text('Cart Detail'),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: FutureBuilder(
        future: fetchCart(token),
        builder: (context, snapshot) {
          var items = snapshot.data;
          if (snapshot.hasData) {
            return Column(
              children: <Widget>[
                Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 6.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Divider(
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FutureBuilder(
                                future: fetchUser(token),
                                builder: ((context, snapshot) {
                                  if (snapshot.hasData) {
                                    var user = snapshot.data!;
                                    if (!isLoadFromServer) {
                                      firstName.text =
                                          user.firstName.toString();
                                      lastName.text = user.lastName.toString();
                                      address.text = user.address.toString();
                                      phone.text = user.phone.toString();
                                      isLoadFromServer = true;
                                    }
                                  }

                                  return Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.account_circle),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                    '${firstName.text} ${lastName.text}'),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      actions: [
                                                        Text(
                                                          'First Name',
                                                          style: TextStyle(
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                        TextField(
                                                          controller: firstName,
                                                          decoration:
                                                              InputDecoration(
                                                                  hintText:
                                                                      'First name'),
                                                        ),
                                                        //Last Name Editor
                                                        Text(
                                                          'Last Name',
                                                          style: TextStyle(
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                        TextField(
                                                          controller: lastName,
                                                          decoration:
                                                              InputDecoration(
                                                                  hintText:
                                                                      'Last name'),
                                                        ),
                                                        //Phone Editor
                                                        Text(
                                                          'Phone',
                                                          style: TextStyle(
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                        TextField(
                                                          controller: phone,
                                                          decoration:
                                                              InputDecoration(
                                                                  hintText:
                                                                      'Phone'),
                                                          keyboardType:
                                                              TextInputType
                                                                  .phone,
                                                        ),
                                                        //Address Editor
                                                        Text(
                                                          'Address',
                                                          style: TextStyle(
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                        TextField(
                                                          controller: address,
                                                          decoration:
                                                              InputDecoration(
                                                                  hintText:
                                                                      'Address'),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            ElevatedButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                });
                                                              },
                                                              // ignore: sort_child_properties_last
                                                              child: Text(
                                                                  'Cancel'),
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .red),
                                                            ),
                                                            SizedBox(
                                                              width: 16,
                                                            ),
                                                            ElevatedButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                });
                                                              },
                                                              // ignore: sort_child_properties_last
                                                              child:
                                                                  Text('Save'),
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .blueAccent),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              child: Icon(Icons.edit),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons
                                                    .location_city_outlined),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                    // ignore: unnecessary_string_interpolations
                                                    '${address.text}'),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons
                                                    .phone_android_outlined),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                    // ignore: unnecessary_string_interpolations
                                                    '${phone.text}'),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }))
                          ],
                        ),
                        Divider(
                          thickness: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: snapshot.data!.cartItems!.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: items!.cartItems!.length,
                            itemBuilder: ((context, index) {
                              return Slidable(
                                // ignore: sort_child_properties_last
                                child: Card(
                                  elevation: 8,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 6.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          // ignore: sort_child_properties_last
                                          child: ClipRRect(
                                            // ignore: sort_child_properties_last
                                            child: Image(
                                              image: NetworkImage(items
                                                  .cartItems![index].toyimages
                                                  .toString()),
                                              fit: BoxFit.fill,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4)),
                                          ),
                                          flex: 2,
                                        ),
                                        Expanded(
                                            flex: 6,
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 8,
                                                              left: 8),
                                                      child: Text(
                                                        '${items.cartItems![index].toy!.name}',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        maxLines: 2,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 8,
                                                              left: 8,
                                                              top: 8),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .monetization_on,
                                                            color: Colors.grey,
                                                            size: 16,
                                                          ),
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 8),
                                                            child: Text(
                                                              // ignore: unnecessary_string_interpolations
                                                              '${items.cartItems![index].toy!.price.toString().replaceAll(regex, '')}',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Center(
                                                        child: Text(
                                                      // ignore: unnecessary_string_interpolations
                                                      '${items.cartItems![index].qty}',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight
                                                              .normal),
                                                    ))
                                                  ]),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                // endActionPane: ActionPane(
                                //     motion: StretchMotion(),
                                //     children: [
                                //       SlidableAction(
                                //         onPressed: ((context) {
                                //           setState(() {
                                //             deleteCart(
                                //                 '${items.cartItems![index].id}',
                                //                 token);
                                //           });
                                //         }),
                                //         backgroundColor: Colors.red,
                                //         icon: Icons.delete,
                                //       )
                                //     ]),
                              );
                            }))
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                'Cart has no Item',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 20),
                              ),
                            ],
                          )),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(

                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  // ignore: unnecessary_string_interpolations
                                  '${snapshot.data!.totalPrice.toString().replaceAll(regex, '')} VND')
                            ],
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: snapshot.data!.cartItems!.isNotEmpty
                                ? ElevatedButton(
                                    onPressed: (() => {
                                          payWithCard(
                                              // ignore: unnecessary_string_interpolations
                                              '${snapshot.data!.totalPrice.toString().replaceAll(regex, '')}'),
                                        }),
                                    child: Text(
                                      'Check Out',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                : Text(''),
                          )
                        ]),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("$snapshot.error");
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
