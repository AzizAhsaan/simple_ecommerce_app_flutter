import 'package:flutter/material.dart';
import 'package:intermediate_ecommerce_app/components/cart_item.dart';
import 'package:intermediate_ecommerce_app/modules/cart.dart';
import 'package:intermediate_ecommerce_app/modules/clothes.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Scaffold(
              appBar: AppBar(
                leading: GestureDetector(
                  child: Icon(Icons.arrow_back),
                  onTap: () => Navigator.pop(context),
                ),
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Text(
                      "My cart",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: value.getCart().length,
                            itemBuilder: (context, index) {
                              Clothes individualClothe = value.getCart()[index];
                              return CartItem(
                                clothes: individualClothe,
                                onTap: () =>
                                    value.removeItemFromCart(individualClothe),
                              );
                            }))
                  ],
                ),
              ),
            ));
  }
}
