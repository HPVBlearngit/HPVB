// ignore_for_file: file_names, unnecessary_import import_of_legacy_library_into_null_safe, prefer_const_constructors, unnecessary_null_comparison, prefer_is_empty, unused_element, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unnecessary_string_interpolations, unnecessary_import, unused_import, avoid_web_libraries_in_flutter, non_constant_identifier_names, unused_local_variable, duplicate_ignore, import_of_legacy_library_into_null_safe, unused_field, deprecated_member_use, unrelated_type_equality_checks, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pvb_toy_app/const/Screen_Const.dart';
import 'package:pvb_toy_app/network/api_cart_request.dart';
import 'package:pvb_toy_app/state/state_management.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/invoice.dart';

// ignore: use_key_in_widget_constructors
class AdminPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _AdminPage createState() => _AdminPage();
}

class _AdminPage extends State<AdminPage> {
  String? token = "";
  final RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
  final GlobalKey<ScaffoldState> _ScraffoldKey = GlobalKey<ScaffoldState>();
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
    var result = await fetchAllInvoice(status);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, ref, child) {
      final currentMenu = ref.watch(adminNavigation.notifier).state;
      return DefaultTabController(
          length: 2,
          child: Scaffold(
              drawer: Drawer(
                  child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (index == 0) {
                                ref.read(adminNavigation.notifier).state =
                                    'root';
                                Navigator.pop(context);
                              } else {
                                ref.read(adminNavigation.notifier).state =
                                    'order';
                                Navigator.pop(context);
                              }
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.list,
                                color: Colors.black54,
                              ),
                              title: Text('Home'),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              )),
              appBar: AppBar(
                title: Center(
                    child: Text(
                  'Admin Page',
                  textAlign: TextAlign.center,
                )),
                actions: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.navigate_next,
                        color: Colors.white,
                      ))
                ],
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
              ])));
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
            List<InvoiceDetail> detail = [];
            double sumInvoice = 0.0;
            for (var element in order) {
              sumInvoice += element.total!;
              if (element.id == ref.read(orderSelected.notifier).state.id) {
                detail.addAll(element.invoiceDetail!);
              }
            }

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
                      // ref.read(orderSelected.notifier).state = order[index];
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: SizedBox(
                              width: 1100,
                              child: ListView.builder(
                                itemCount: detail.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '${detail[index].toy!.name}',
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    detail[index]
                                                        .toy!
                                                        .toyImage![0]
                                                        .url
                                                        .toString()),
                                              ),
                                              Text(
                                                '${detail[index].toy!.price.toString().replaceAll(regex, '')} VND',
                                                style: GoogleFonts.montserrat(),
                                              ),
                                              Text(
                                                '${detail[index].quantity.toString()}',
                                                style: GoogleFonts.montserrat(),
                                              ),
                                              // Text(
                                              //   '${detail[index].toy!.brand!.brand}',
                                              //   style: GoogleFonts.montserrat(
                                              //       fontWeight:
                                              //           FontWeight.bold),
                                              // ),
                                              // Text(
                                              //   '${detail[index].toy!.category!.category}',
                                              //   style: GoogleFonts.montserrat(
                                              //       fontWeight:
                                              //           FontWeight.bold),
                                              // ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      );
                    }),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${order[index].user!.firstName} ${order[index].user!.lastname}',
                                      style:
                                          GoogleFonts.montserrat(fontSize: 16),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      var isDelivery = order[index].delivery;
                                      showDialog(
                                          context: context,
                                          builder: ((context) => AlertDialog(
                                                title: Text('Update Order'),
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    ElevatedButton(
                                                        onPressed: isDelivery ==
                                                                false
                                                            ? null
                                                            : (() {
                                                                setState(() {
                                                                  UpdateOrder(
                                                                      false,
                                                                      context,
                                                                      ref,
                                                                      order[
                                                                          index]);
                                                                });
                                                              }),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                primary: Colors
                                                                    .indigo,
                                                                onPrimary:
                                                                    Colors
                                                                        .white),
                                                        child:
                                                            Text('Delivery')),
                                                    ElevatedButton(
                                                        onPressed: isDelivery ==
                                                                true
                                                            ? null
                                                            : () {
                                                                setState(() {
                                                                  UpdateOrder(
                                                                      true,
                                                                      context,
                                                                      ref,
                                                                      order[
                                                                          index]);
                                                                });
                                                              },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                primary: Colors
                                                                    .green,
                                                                onPrimary:
                                                                    Colors
                                                                        .white),
                                                        child:
                                                            Text(' Placed ')),
                                                  ],
                                                ),
                                                actions: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Container(
                                                            color: Colors
                                                                .blueAccent,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(16),
                                                            child: Text(
                                                              "Close",
                                                              style: GoogleFonts
                                                                  .montserrat(
                                                                      fontSize:
                                                                          16,
                                                                      color: Colors
                                                                          .white),
                                                            ),
                                                          )),
                                                    ],
                                                  )
                                                ],
                                              )));
                                    },
                                    child: Icon(Icons.more_vert),
                                  )
                                ],
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

UpdateOrder(
    bool status, BuildContext context, WidgetRef ref, myInvoice invoice) async {
  var result = await updateInvoiceState(invoice.id, status);
  if (result == 200) {
    invoice.delivery = status;
    ref.read(orderChange.notifier).state == invoice;
  }
  Navigator.pop(context);
}
