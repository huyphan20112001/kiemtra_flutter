import 'package:didong/food_page.dart';
import 'package:didong/homepage.dart';
import 'package:didong/login_page.dart';
import 'package:didong/productlist_page.dart';
import 'package:didong/provider/product_provider.dart';
import 'package:didong/slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => ProductProvider())],
    child: MaterialApp(
      home: ProductListPage(),
    ),
  ));
}
