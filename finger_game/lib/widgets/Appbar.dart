import 'package:finger_game/models/product.dart';
import 'package:flutter/material.dart';
class Appbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback press;
  final Color? backgroundColor;
  final Color? tColor;
  final String? title;

  final bool isSearching;
  final TextEditingController? controller;
  final Function(String)? onSearch;
  final VoidCallback? onSearchPressed;
  final VoidCallback? onClosePressed;
  final IconData? icon;

  const Appbar({
    super.key,
    required this.press,
    this.icon,
    this.backgroundColor,
    this.tColor,
    this.title,
    this.isSearching = false,
    this.controller,
    this.onSearch,
    this.onSearchPressed,
    this.onClosePressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon:Icon(icon??Icons.arrow_back, color: tColor??Colors.black,),
        onPressed: press,
      ),

      title: !isSearching
          ? Text(
              title ?? "",
              style: TextStyle(color: tColor ?? Colors.black),
            )
          : TextField(
              controller: controller,
              autofocus: true,
              onChanged: onSearch,
             
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.search),
                ),
                hintText: "Search...",
                border:InputBorder.none,
              ),
              style: TextStyle(color: tColor ?? Colors.black),
            ),

      actions: [
        !isSearching
            ? IconButton(
                onPressed: onSearchPressed,
                icon: Icon(Icons.search, color: tColor ?? Colors.black),
              )
            : IconButton(
                onPressed: onClosePressed,
                icon: Icon(Icons.close, color: tColor ?? Colors.black),
              ),

        IconButton(
          onPressed: () {},
          icon: Icon(Icons.shopping_cart, color: tColor ?? Colors.black),
        ),
      ],
      backgroundColor: backgroundColor,
    );
  }
}