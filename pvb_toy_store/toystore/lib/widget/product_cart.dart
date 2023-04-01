// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pvb_toy_app/model/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pvb_toy_app/state/state_management.dart';
// ignore: duplicate_import
import '../model/product.dart';

// ignore: must_be_immutable
class ProductCard extends ConsumerWidget {
  final myToy product;
  final RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
  double salePrice = 0;

  ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (product.discount?.id != null) {
      salePrice = (product.price! -
          ((product.price! * (product.discount!.percent! / 100))));
    }
    return GestureDetector(
      child: Card(
        elevation: 10,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.network(
                  product.toyImage![0].url.toString(),
                  fit: BoxFit.fill,
                ),
                product.discount?.id != null
                    ? Column(
                        children: [
                          Container(
                            // ignore: prefer_const_constructors
                            color: Color(0xDD333639),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                product.discount!.description.toString(),
                                // ignore: prefer_const_constructors
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      )
                    : Container(),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      '${product.name}',
                      maxLines: 6,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4.5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: salePrice == 0
                                ? ''
                                : '${product.price.toString().replaceAll(regex, '')}VND',
                            style: TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough),
                          ),
                          product.discount?.id != null
                              ? TextSpan(
                                  text:
                                      '\n${salePrice.toString().replaceAll(regex, '')}VND',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                )
                              : TextSpan(),
                          product.discount?.id != null
                              ? TextSpan(
                                  text:
                                      '\nDistcount: ${product.discount?.percent.toString()}%',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : product.discount?.id == null
                                  ? TextSpan(
                                      text:
                                          '\n${product.price.toString().replaceAll(regex, '')}VND',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    )
                                  : TextSpan()
                        ]))
                      ],
                    ),
                  ]),
            )
          ],
        ),
      ),
      onTap: () {
        ref.read(productSelected.notifier).state = product;
        Navigator.of(context).pushNamed('/productDetail');
      },
    );
  }
}
