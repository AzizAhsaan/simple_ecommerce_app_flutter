import 'package:flutter/material.dart';
import 'package:intermediate_ecommerce_app/pages/cart_page.dart';
import 'package:intermediate_ecommerce_app/pages/intro_page.dart';
import 'package:intermediate_ecommerce_app/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    // Shop Page

    ShopPage(),

    // CartPage

    CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ShopPage(),
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          leading: Builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
          ),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPage())),
                  child: Icon(Icons.shopping_cart)),
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              DrawerHeader(
                child: Image.asset(
                  "lib/images/cartGIF.gif",
                  height: 150,
                  width: 150,
                ),
                decoration:
                    BoxDecoration(border: Border(bottom: BorderSide.none)),
              ),
              ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => IntroPage()));
                  }),
              ListTile(
                  leading: Icon(Icons.shop),
                  title: Text("Shop"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text("Cart"),
                onTap: () {
                  print("Go to cart page");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPage()));
                },
              )
            ],
          ),
        ));
  }
}
