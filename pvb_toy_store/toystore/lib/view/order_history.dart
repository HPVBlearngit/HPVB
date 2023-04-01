// ignore_for_file: unnecessary_import, import_of_legacy_library_into_null_safe, sized_box_for_whitespace, unused_field, prefer_const_constructors, unused_import, unnecessary_null_comparison, prefer_is_empty, use_full_hex_values_for_flutter_colors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kenburns/kenburns.dart';
import 'package:pvb_toy_app/model/invoice.dart';
import 'package:pvb_toy_app/model/user.dart';
import 'package:pvb_toy_app/network/api_cart_request.dart';
import 'package:pvb_toy_app/network/user.dart';
import 'package:pvb_toy_app/state/state_management.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

// ignore: use_key_in_widget_constructors
class OrderHistory extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _OrderHistory createState() => _OrderHistory();
}

class _OrderHistory extends State<OrderHistory> {
  String? token = "";
  final RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
  @override
  // ignore: must_call_super
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    getToken();
  }

  void getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString('token');
    });
  }

  Future<List<myInvoice>> _fetchInvoice(int status) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var result = await fetchInvoice(pref.getString('token'), status);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, ref, child) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Center(
                  child: Text(
                'Order History',
                textAlign: TextAlign.center,
                )),
              leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  )),
              backgroundColor: Color(0xFF0C1B37),
              // ignore: prefer_const_literals_to_create_immutables
              bottom: TabBar(tabs: [
                Tab(
                  child: Text('Delivery'),
                ),
                Tab(
                  child: Text('Placed'),
                ),
              ]),
            ),
            resizeToAvoidBottomInset: true,
            backgroundColor: Color(0xFF0C1B37),
            body: TabBarView(children: [
              _orderHistoryWidget(context, 0, ref), //is delivery = 0
              _orderHistoryWidget(context, 1, ref), //is delivery = 1
            ])),
      );
    }));
  }

  Widget _orderHistoryWidget(
      BuildContext context, int? isDelivery, WidgetRef ref) {
    return FutureBuilder(
        future: _fetchInvoice(isDelivery!),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var order = snapshot.data as List<myInvoice>;

            if (order == null || order.length == 0) {
              return Center(
                child: Text(
                  'You have 0 Orders',
                  style:
                      GoogleFonts.montserrat(color: Colors.white, fontSize: 16),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: order.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (() {
                      ref.read(orderSelected.notifier).state = order[index];
                      Navigator.of(context).pushNamed('/orderDetail');
                    }),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${order[index].user!.firstName} ${order[index].user!.lastname}',
                                style: GoogleFonts.montserrat(fontSize: 16),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Order time: ${DateFormat('yyyy-MM-dd').parse(DateTime.parse(order[index].createAt!).toString()).toString().replaceAll('00:00:00.000', '')}',
                                style: GoogleFonts.montserrat(fontSize: 16),
                              ),
                              Divider(
                                thickness: 2,
                              ),
                              IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          // ignore: unnecessary_string_interpolations
                                          'Total',
                                          style: GoogleFonts.montserrat(
                                              color: Colors.grey),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          // ignore: unnecessary_string_interpolations
                                          '${order[index].total.toString().replaceAll(regex, '')} VND',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    VerticalDivider(
                                      thickness: 1,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          // ignore: unnecessary_string_interpolations
                                          'Payment',
                                          style: GoogleFonts.montserrat(
                                              color: Colors.grey),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          // ignore: unnecessary_string_interpolations
                                          'Creadit Card',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 2,
                              ),
                              Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Icon(
                                    Icons.location_city_outlined,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    // ignore: unnecessary_string_interpolations
                                    '${order[index].user!.address}',
                                    style: GoogleFonts.montserrat(fontSize: 13),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }
        }));
  }
}
