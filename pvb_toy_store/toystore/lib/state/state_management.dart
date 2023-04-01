import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pvb_toy_app/model/brand.dart';
import 'package:pvb_toy_app/model/category.dart';
import 'package:pvb_toy_app/model/discount.dart';
import 'package:pvb_toy_app/model/invoice.dart';
import 'package:pvb_toy_app/model/product.dart';
import 'package:pvb_toy_app/model/user.dart';

final categorySelected = StateProvider((ref) => myCategory());
final productSelected = StateProvider(((ref) => myToy()));
final brandSelected = StateProvider(((ref) => myBrand()));
final discountSelected = StateProvider(((ref) => myDiscount()));
final orderSelected = StateProvider(((ref) => myInvoice()));
final adminNavigation = StateProvider(((ref) => 'root'));
final roleSelected = StateProvider(((ref) => myUser()));
final orderChange = StateProvider(((ref) => myInvoice()));
