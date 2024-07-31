import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intermediate_ecommerce_app/modules/clothes.dart';

class ClotheTile extends StatelessWidget {
  Clothes clothe;
  void Function()? AddClotheToCart;
  void Function()? RemoveClotheFromFavoriteList;
  void Function()? AddClotheToFavoriteList;
  final bool isFavorite;

  ClotheTile(
      {super.key,
      required this.clothe,
      required this.AddClotheToFavoriteList,
      required this.AddClotheToCart,
      required this.RemoveClotheFromFavoriteList,
      this.isFavorite = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 25),
          width: 280,
          height: 300,
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //clothe pic
                Stack(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          clothe.image,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: GestureDetector(
                          onTap: isFavorite
                              ? RemoveClotheFromFavoriteList
                              : AddClotheToFavoriteList,
                          child: Icon(
                            Icons.favorite,
                            color: isFavorite ? Colors.red : Colors.grey[500],
                          )),
                    ),
                  ],
                ),

                // clothe description
                Text(
                  clothe.description,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                //price+detials

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(clothe.name,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 14)),
                          Text(clothe.price,
                              style: const TextStyle(color: Colors.grey))
                        ],
                      ),
                      GestureDetector(
                        onTap: AddClotheToCart,
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black),
                            child: const Icon(Icons.add, color: Colors.white)),
                      )
                    ],
                  ),
                )

                //button to add to cart
              ],
            ),
          ),
        ),
        SizedBox(
          height: 0,
        )
      ],
    );
  }
}
