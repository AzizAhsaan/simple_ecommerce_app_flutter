import 'package:flutter/material.dart';
import 'package:intermediate_ecommerce_app/components/clothe_tile.dart';
import 'package:intermediate_ecommerce_app/modules/cart.dart';
import 'package:intermediate_ecommerce_app/modules/clothes.dart';
import 'package:intermediate_ecommerce_app/pages/cart_page.dart';
import 'package:intermediate_ecommerce_app/pages/home_page.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addClotheToCart(Clothes clothe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(context, clothe);
  }

  void addClotheToFavoriteList(Clothes clothe) {
    Provider.of<Cart>(context, listen: false)
        .addItemToFavorite(context, clothe);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Column(
              children: [
                Text("Shop Page",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(
                  height: 50,
                ),
                Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          Clothes clothe = value.getClothesList()[index];
                          bool isFavorite =
                              value.userFavoriteItems.contains(clothe);
                          return ClotheTile(
                            AddClotheToCart: () => addClotheToCart(clothe),
                            AddClotheToFavoriteList: () =>
                                addClotheToFavoriteList(clothe),
                            clothe: clothe,
                            isFavorite: isFavorite,
                            RemoveClotheFromFavoriteList: () =>
                                value.removeItemFromFavorite(clothe),
                          );
                        }))
              ],
            ));
  }
}
