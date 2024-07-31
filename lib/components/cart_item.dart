import 'package:flutter/material.dart';
import 'package:intermediate_ecommerce_app/modules/clothes.dart';

class CartItem extends StatefulWidget {
  Clothes clothes;
  void Function()? onTap;
  CartItem({super.key, required this.clothes, this.onTap});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(widget.clothes.image),
      title: Text(
        widget.clothes.name,
      ),
      subtitle: Text(widget.clothes.price),
      trailing: ElevatedButton(
        onPressed: widget.onTap,
        child: const Text("remove"),
      ),
    );
  }
}
