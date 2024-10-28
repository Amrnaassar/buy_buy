import 'package:buy_buy/screens/categories.dart';
import 'package:flutter/material.dart';
import 'package:buy_buy/screens/product/views/popular_products.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id='HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Categories(),
            PopularProducts(),

          ],
        ),
      ),
    ) ;
  }
}
