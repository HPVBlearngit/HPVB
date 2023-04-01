// ignore_for_file: file_names, unnecessary_import, unused_import, import_of_legacy_library_into_null_safe, prefer_const_constructors, unnecessary_null_comparison, prefer_is_empty, unused_element, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unnecessary_string_interpolations

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
class OrderDetail extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _OrderDetail createState() => _OrderDetail();
}

class _OrderDetail extends State<OrderDetail> {
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

  Future<List<myInvoice>> _fetchInvoice() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var result = await fetchInvoiceByuser(pref.getString('token'));
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, ref, child) {
      return Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text(
              'Order #${ref.read(orderSelected.notifier).state.id.toString().padLeft(6, '0')}',
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
          ),
          resizeToAvoidBottomInset: true,
          backgroundColor: Color(0xFF0C1B37),
          body: FutureBuilder(
            future: _fetchInvoice(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var order = snapshot.data as List<myInvoice>;
                List<InvoiceDetail> detail = [];
                for (var element in order) {
                  if (element.id == ref.read(orderSelected.notifier).state.id) {
                    detail.addAll(element.invoiceDetail!);
                  }
                }
                if (order == null) {
                  return Center(
                    child: Text(
                      'Cannot get Order Detail',
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 16),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: detail.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${detail[index].toy!.name}',
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.bold),
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
                                      'Price:   ${detail[index].toy!.price.toString().replaceAll(regex, '')} VND',
                                      style: GoogleFonts.montserrat(),
                                    ),
                                    Text(
                                      'Quantity:   ${detail[index].quantity.toString()}',
                                      style: GoogleFonts.montserrat(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              }
            },
          ));
    }));
  }
}
