import 'package:flutter/material.dart';
import 'package:intermediate_ecommerce_app/modules/clothes.dart';

class FavoriteListItem extends StatefulWidget {
  Clothes clothes;
  void Function()? onTap;
  FavoriteListItem({super.key, required this.clothes, this.onTap});

  @override
  State<FavoriteListItem> createState() => _FavoriteListItemState();
}

class _FavoriteListItemState extends State<FavoriteListItem> {
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
