// ignore_for_file: avoid_unnecessary_containers, library_private_types_in_public_api

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:pvb_toy_app/state/state_management.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../network/api_cart_request.dart';
import '../network/api_request.dart';
import 'package:pvb_toy_app/model/product.dart';

// ignore: use_key_in_widget_constructors
class ProductDetailPage extends StatefulWidget {
  @override
  _ProductDetailPage createState() => _ProductDetailPage();
}

class _ProductDetailPage extends State<ProductDetailPage> {
  final RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

  // ignore: top_level_function_literal_block
  final _fetchProductById = FutureProvider.family<myToy, int?>((ref, id) async {
    var result = await fetchProductById(id);
    return result;
  });

  final _fetchCart = FutureProvider((ref) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var result = await fetchCart(pref.getString('token'));
    return result;
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        int? id = ref.read(productSelected.notifier).state.id;
        var productApiResult = ref.watch(_fetchProductById(id));
        // ignore: unused_local_variable
        var cartApiResult = ref.watch(_fetchCart);
        return Scaffold(
          appBar: AppBar(
            // ignore: prefer_const_constructors
            title: Text('Toy Detail'),
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              // ignore: prefer_const_constructors
              child: Icon(Icons.arrow_back),
            ),
          ),
          body: Builder(
            builder: (context) {
              return SafeArea(
                  child: Column(
                children: [
                  Expanded(
                    child: productApiResult.when(
                        data: (product) => SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        CarouselSlider(
                                          items: product.toyImage
                                              ?.map((e) =>
                                                  Builder(builder: (context) {
                                                    return Container(
                                                      child: Image(
                                                        image: NetworkImage(
                                                            e.url.toString()),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    );
                                                  }))
                                              .toList(),
                                          options: CarouselOptions(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  3 *
                                                  2.5,
                                              autoPlay: true,
                                              viewportFraction: 1,
                                              initialPage: 0),
                                        )
                                      ],
                                    ),
                                    //name product
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        '${product.name}',
                                        // ignore: prefer_const_constructors
                                        style: TextStyle(fontSize: 40),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        'Category: ${product.category!.category}',
                                        // ignore: prefer_const_constructors
                                        style: TextStyle(fontSize: 20),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        'Brand: ${product.brand!.brand}',
                                        style: const TextStyle(fontSize: 20),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),

                                    //price product
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text.rich(TextSpan(children: [
                                            product.discount?.id != null
                                                ? TextSpan(
                                                    text:
                                                        'Price: ${product.price.toString().replaceAll(regex, '')}VND',
                                                    // ignore: prefer_const_constructors
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough),
                                                  )
                                                : const TextSpan(),
                                            product.discount?.id != null
                                                ? TextSpan(
                                                    text:
                                                        '\nPrice: ${(product.price! - ((product.price! * (product.discount!.percent! / 100)))).toString().replaceAll(regex, '')}VND',
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                  )
                                                : const TextSpan(),
                                            product.discount?.id != null
                                                ? TextSpan(
                                                    text:
                                                        '\nDistcount: ${product.discount?.percent.toString()}%',
                                                    style: const TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
                                                : product.discount?.id == null
                                                    ? TextSpan(
                                                        text:
                                                            '\nPrice: ${product.price.toString().replaceAll(regex, '')}VND',
                                                        style: const TextStyle(
                                                          fontSize: 20,
                                                        ),
                                                      )
                                                    : const TextSpan()
                                          ]))
                                        ],
                                      ),
                                    ),
                                    //qty
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        'Quantity: ${product.qtyInStock}',
                                        style: const TextStyle(fontSize: 20),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                    //description
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        '${product.description}',
                                        style: const TextStyle(fontSize: 20),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                    //button
                                    Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 8, right: 8),
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setState(() async {
                                                SharedPreferences pref =
                                                    await SharedPreferences
                                                        .getInstance();
                                                if (pref.getString('token') ==
                                                    null) {
                                                  // ignore: use_build_context_synchronously
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: const Text(
                                                          'Login Or Register to buy toy'),
                                                      action: SnackBarAction(
                                                        label: 'OK',
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pushNamed(
                                                                  '/login');
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                } else {
                                                  // ignore: unnecessary_null_comparison
                                                  if (!cartApiResult
                                                          .value!
                                                          .cartItems!
                                                          .isNotEmpty ||
                                                      cartApiResult
                                                          .value!.cartItems!
                                                          .every((element) =>
                                                              element.toy!.id !=
                                                              id)) {
                                                    createCart(
                                                        "$id",
                                                        "1",
                                                        pref.getString(
                                                            'token'));
                                                    fetchCart(pref
                                                        .getString('token'));

                                                    // ignore: use_build_context_synchronously
                                                    showSnackBar(context,
                                                        "added item to cart!");
                                                  } else {
                                                    // if (cartApiResult.value!.cartItems!
                                                    //     .every((element) =>
                                                    //         element.toy!.id != id)) {
                                                    //   SharedPreferences pref =
                                                    //       await SharedPreferences
                                                    //           .getInstance();

                                                    //   createCart("$id", "1",
                                                    //       pref.getString('token'));
                                                    //   // ignore: use_build_context_synchronously
                                                    //   showSnackBar(context,
                                                    //       "added item to cart!");
                                                    // } else {
                                                    //   showSnackBar(context,
                                                    //       "Toy already in cart!");
                                                    // }

                                                    // ignore: use_build_context_synchronously
                                                    showSnackBar(context,
                                                        "Toy already in cart!");
                                                  }
                                                }
                                              });
                                            },
                                            // ignore: prefer_const_constructors
                                            child: Text(
                                              'Add To Bag',
                                              // ignore: prefer_const_constructors
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ]),
                            ),
                        error: (error, stack) => Center(
                              child: Text("$error"),
                            ),
                        loading: () =>
                            const Center(child: CircularProgressIndicator())),
                  ),
                ],
              ));
            },
          ),
        );
      },
    );
  }

  void showSnackBar(BuildContext context, String s) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      // ignore: unnecessary_string_interpolations
      content: Text('$s'),
      action: SnackBarAction(
          label: 'view cart',
          onPressed: () async {
            Navigator.of(context).pushNamed('/cartDetail');
          }),
    ));
  }
}
