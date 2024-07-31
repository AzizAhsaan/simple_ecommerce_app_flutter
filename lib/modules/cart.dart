import "package:flutter/material.dart";
import "clothes.dart";

class Cart extends ChangeNotifier {
  // list of clothes for sale

  List<Clothes> clothesShop = [
    Clothes(
      name: "T-shirt",
      price: "10.99",
      image: "lib/images/Tshirt1.png",
      description: "This is a t-shirt",
    ),
    Clothes(
      name: "Shirt",
      price: "15.99",
      image: "lib/images/shirt.png",
      description: "This is a shirt",
    ),
    Clothes(
      name: "Jeans",
      price: "20.99",
      image: "lib/images/jeans.png",
      description: "This is a jeans",
    ),
    Clothes(
      name: "Jacket",
      price: "25.99",
      image: "lib/images/jacket.png",
      description: "This is a jacket",
    ),
  ];

// list of items in user cart

  List<Clothes> userItems = [];
  List<Clothes> userFavoriteItems = [];

// get list of shoes for sale

  List<Clothes> getClothesList() {
    return clothesShop;
  }

  //get cart

  List<Clothes> getCart() {
    return userItems;
  }

  List<Clothes> getFavorites() {
    return userItems;
  }

  // add item to cart

  void addItemToCart(BuildContext context, Clothes clothe) async {
    if (userItems.contains(clothe)) {
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Item already in cart'),
                content: const Text('You can only add one item at a time'),
              ));
      notifyListeners();
      return;
    }
    userItems.add(clothe);
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Item added to cart'),
              content: const Text('Item added to cart successfully'),
            ));
    notifyListeners();
  }

  void removeItemFromCart(Clothes clothe) {
    userItems.remove(clothe);
    notifyListeners();
  }

  void addItemToFavorite(BuildContext context, Clothes clothe) async {
    if (userFavoriteItems.contains(clothe)) {
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Item already in favorite list'),
                content: const Text('You can only add one item at a time'),
              ));
      notifyListeners();
      return;
    }
    userFavoriteItems.add(clothe);
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Item added to favorite favorite list'),
              content: const Text('Item added to favorite list successfully'),
            ));
    notifyListeners();
  }

  void removeItemFromFavorite(Clothes clothe) {
    userFavoriteItems.remove(clothe);
    notifyListeners();
  }
}
