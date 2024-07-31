import 'package:flutter/material.dart';
import 'package:intermediate_ecommerce_app/modules/cart.dart';
import 'package:intermediate_ecommerce_app/modules/clothes.dart';
import 'package:intermediate_ecommerce_app/pages/home_page.dart';
import 'package:intermediate_ecommerce_app/pages/intro_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => const MaterialApp(
          debugShowCheckedModeBanner: false, home: IntroPage()),
    );
  }
}
