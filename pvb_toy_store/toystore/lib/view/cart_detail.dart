// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// ignore: import_of_legacy_library_into_null_safe
// ignore: unused_import
import 'package:pvb_toy_app/model/cart.dart';
import 'package:pvb_toy_app/network/api_cart_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: use_key_in_widget_constructors
class CartDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CartDetailState();
}

class CartDetailState extends State<CartDetail> {
  final RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
  String? token = "";
  @override
  void initState() {
    super.initState();
    fetchCart(token);
    getToken();
  }

  void getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString('token');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Detail'),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: FutureBuilder(
        future: fetchCart(token),
        builder: (context, snapshot) {
          var items = snapshot.data;
          if (snapshot.hasData) {
            return Column(
              children: <Widget>[
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
                                                      child:
                                                          ElegantNumberButton(
                                                        initialValue: items
                                                            .cartItems![index]
                                                            .qty!,
                                                        minValue: 1,
                                                        maxValue: items
                                                            .cartItems![index]
                                                            .toy!
                                                            .qtyInStock!,
                                                        buttonSizeHeight: 20,
                                                        buttonSizeWidth: 25,
                                                        color: Colors.white38,
                                                        decimalPlaces: 0,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            items
                                                                    .cartItems![
                                                                        index]
                                                                    .qty =
                                                                value as int;
                                                            updateCart(
                                                                '${items.cartItems![index].id}',
                                                                '${items.cartItems![index].toy!.id}',
                                                                // ignore: unnecessary_brace_in_string_interps
                                                                '${value}',
                                                                token);
                                                          });
                                                        },
                                                      ),
                                                    )
                                                  ]),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                endActionPane: ActionPane(
                                    motion: StretchMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: ((context) {
                                          setState(() {
                                            deleteCart(
                                                '${items.cartItems![index].id}',
                                                token);
                                          });
                                        }),
                                        backgroundColor: Colors.red,
                                        icon: Icons.delete,
                                      )
                                    ]),
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
                                    onPressed: (() => Navigator.of(context)
                                        .pushNamed('/checkOut')),
                                    child: Text(
                                      'Place to Check Out',
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
