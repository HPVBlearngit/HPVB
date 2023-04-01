// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:pvb_toy_app/state/state_management.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../network/api_request.dart';
import 'package:pvb_toy_app/model/product.dart';

import '../widget/product_cart.dart';

class ProductListPage extends ConsumerWidget {
  // ignore: top_level_function_literal_block
  final _fetchCategory = FutureProvider((ref) async {
    var result = await fetchCategory();
    return result;
  });

  final _fetchBrand = FutureProvider((ref) async {
    var result = await fetchBrand();
    return result;
  });
  final _fetchDiscount = FutureProvider((ref) async {
    var result = await fetchDiscount();
    return result;
  });

  // ignore: top_level_function_literal_block
  final _fetchProductByCategory =
      FutureProvider.family<List<myToy>, int?>((ref, categoryId) async {
    var result = await fetchProductByCategory(categoryId);
    return result;
  });

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int? id = ref.read(categorySelected.notifier).state.id;
    var categoryApiResult = ref.watch(_fetchCategory);
    var productApiResult = ref.watch(_fetchProductByCategory(id));
    var brandApiResult = ref.watch(_fetchBrand);
    var discountApiResult = ref.watch(_fetchDiscount);
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
          child: ListView(
        children: [
          ExpansionTile(
            // ignore: prefer_const_constructors
            title: Text('Category'),
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 200.0,
                    child: categoryApiResult.when(
                        data: (category) => ListView.builder(
                              itemCount: category.length,
                              itemBuilder: ((context, index) {
                                return Card(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: ListTile(
                                      onTap: () {
                                        ref
                                            .read(categorySelected.notifier)
                                            .state
                                            .id = category[index].id;
                                        ref
                                                .read(categorySelected.notifier)
                                                .state
                                                .category =
                                            category[index].category;
                                        Navigator.of(context)
                                            .pushNamed('/productList');
                                      },
                                      title: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                category[index]
                                                    .catImg
                                                    .toString()),
                                          ),
                                          // ignore: prefer_const_constructors
                                          SizedBox(
                                            width: 30,
                                          ),
                                          category[index]
                                                      .category
                                                      .toString()
                                                      .length <=
                                                  10
                                              ? Text(category[index]
                                                  .category
                                                  .toString())
                                              : Text(
                                                  category[index]
                                                      .category
                                                      .toString(),
                                                  // ignore: prefer_const_constructors
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                )
                                        ],
                                      )),
                                ));
                              }),
                            ),
                        error: (error, stack) => Center(
                              child: Text("$error"),
                            ),
                        loading: () =>
                            const Center(child: CircularProgressIndicator())),
                  )
                ],
              )
            ],
          ),
          ExpansionTile(
            // ignore: prefer_const_constructors
            title: Text('Brand'),
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 200.0,
                    child: brandApiResult.when(
                        data: (brand) => ListView.builder(
                              itemCount: brand.length,
                              itemBuilder: ((context, index) {
                                return Card(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: ListTile(
                                      onTap: () {
                                        ref
                                            .read(brandSelected.notifier)
                                            .state
                                            .id = brand[index].id;
                                        ref
                                            .read(brandSelected.notifier)
                                            .state
                                            .brand = brand[index].brand;
                                        Navigator.of(context)
                                            .pushNamed('/producBrandList');
                                      },
                                      title: Row(
                                        children: [
                                          // ignore: prefer_const_constructors
                                          SizedBox(
                                            width: 30,
                                          ),
                                          brand[index]
                                                      .brand
                                                      .toString()
                                                      .length <=
                                                  10
                                              ? Text(
                                                  brand[index].brand.toString())
                                              : Text(
                                                  brand[index].brand.toString(),
                                                  // ignore: prefer_const_constructors
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                )
                                        ],
                                      )),
                                ));
                              }),
                            ),
                        error: (error, stack) => Center(
                              child: Text("$error"),
                            ),
                        loading: () =>
                            const Center(child: CircularProgressIndicator())),
                  )
                ],
              )
            ],
          ),
          ExpansionTile(
            title: Text('Discount'),
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 200.0,
                    child: discountApiResult.when(
                        data: (discount) => ListView.builder(
                              itemCount: discount.length,
                              itemBuilder: ((context, index) {
                                return Card(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: ListTile(
                                      onTap: () {
                                        ref
                                            .read(discountSelected.notifier)
                                            .state
                                            .id = discount[index].id;
                                        ref
                                            .read(discountSelected.notifier)
                                            .state
                                            .name = discount[index].name;
                                        Navigator.of(context)
                                            .pushNamed('/producDiscountList');
                                      },
                                      title: Row(
                                        children: [
                                          // ignore: prefer_const_constructors
                                          SizedBox(
                                            width: 30,
                                          ),
                                          discount[index]
                                                      .name
                                                      .toString()
                                                      .length <=
                                                  10
                                              ? Text(discount[index]
                                                  .name
                                                  .toString())
                                              : Text(
                                                  discount[index]
                                                      .name
                                                      .toString(),
                                                  // ignore: prefer_const_constructors
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                )
                                        ],
                                      )),
                                ));
                              }),
                            ),
                        error: (error, stack) => Center(
                              child: Text("$error"),
                            ),
                        loading: () =>
                            const Center(child: CircularProgressIndicator())),
                  )
                ],
              )
            ],
          )
        ],
      )),
      body: SafeArea(
          child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        // ignore: prefer_const_constructors
                        icon: Icon(
                          Icons.menu,
                          size: 35,
                          color: Colors.black,
                        ),
                        onPressed: () =>
                            _scaffoldKey.currentState?.openDrawer()),
                    // ignore: prefer_const_constructors
                    Text(
                      'PvB Toy Shop',
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                    Row(
                      children: [
                        IconButton(
                            // ignore: prefer_const_constructors
                            icon: Icon(
                              Icons.shopping_bag_outlined,
                              size: 30,
                              color: Colors.black,
                            ),
                            onPressed: () async {
                              // ignore: unnecessary_null_comparison
                              SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                              if (pref.getString('token') == null) {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text(
                                        'Login Or Register to see Cart'),
                                    action: SnackBarAction(
                                      label: 'OK',
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamed('/login');
                                      },
                                    ),
                                  ),
                                );
                              } else {
                                // ignore: use_build_context_synchronously
                                Navigator.of(context).pushNamed('/cartDetail');
                              }
                            }),
                        IconButton(
                            // ignore: prefer_const_constructors
                            icon: Icon(
                              Icons.home_filled,
                              size: 30,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/home');
                            })
                      ],
                    ),
                  ]),
              Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.amberAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Center(
                            child: Text(
                                '${ref.read(categorySelected.notifier).state.category}')),
                      ))
                ],
              ),
            ],
          ),
          // ignore: unrelated_type_equality_checks
          Expanded(
            child: productApiResult.when(
                data: (products) => GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      childAspectRatio: 0.46,
                      children:
                          products.map((e) => ProductCard(product: e)).toList(),
                    ),
                error: (error, stack) => Center(
                      child: Text("$error"),
                    ),
                loading: () =>
                    const Center(child: CircularProgressIndicator())),
          )
          // ignore: prefer_const_constructors, unrelated_type_equality_checks
        ],
      )),
    );
  }
}
