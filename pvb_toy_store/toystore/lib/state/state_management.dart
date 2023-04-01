import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toystore/model/brand.dart';
import 'package:toystore/model/category.dart';
import 'package:toystore/model/discount.dart';
import 'package:toystore/model/invoice.dart';
import 'package:toystore/model/product.dart';
import 'package:toystore/model/user.dart';

final categorySelected = StateProvider((ref) => myCategory());
final productSelected = StateProvider(((ref) => myToy()));
final brandSelected = StateProvider(((ref) => myBrand()));
final discountSelected = StateProvider(((ref) => myDiscount()));
final orderSelected = StateProvider(((ref) => myInvoice()));
final adminNavigation = StateProvider(((ref) => 'root'));
final roleSelected = StateProvider(((ref) => myUser()));
final orderChange = StateProvider(((ref) => myInvoice()));
