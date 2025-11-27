import 'package:finger_game/l10n/app_localizations.dart';
import 'package:finger_game/pages/cartpage.dart';
import 'package:finger_game/provider/cartprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Appbar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback? press;
  final Color? backgroundColor;
  final Color? tColor;
  final String? title;
  final List<Widget>? actions;

  final bool isSearching;
  final TextEditingController? controller;
  final Function(String)? onSearch;
  final VoidCallback? onSearchPressed;
  final VoidCallback? onClosePressed;
  final IconData? icon;
  final IconData? sicon;

  const Appbar({
    super.key,
    this.press,
    this.icon,
    this.sicon,
    this.backgroundColor,
    this.tColor,
    this.title,
    this.isSearching = false,
    this.controller,
    this.onSearch,
    this.onSearchPressed,
    this.onClosePressed,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: widget.backgroundColor,

     
      leading: IconButton(
        icon: Icon(
          widget.icon ?? Icons.arrow_back,
          color: widget.tColor ?? Colors.black,
        ),
        onPressed: widget.press ?? (){
          Scaffold.of(context).openDrawer();
        },
      ),

     
      title: widget.isSearching
          ? TextField(
              controller: widget.controller,
              autofocus: true,
              onChanged: widget.onSearch,
              decoration:  InputDecoration(
                hintText:AppLocalizations.of(context)!.searchHint,
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
              ),
              style: TextStyle(color: widget.tColor ?? Colors.black),
            )
          : Text(
              widget.title ?? "",
              style: TextStyle(color: widget.tColor ?? Colors.black,
              fontWeight: FontWeight.bold),
            ),

      
      actions: [
       
        widget.isSearching
            ? IconButton(
                icon: Icon(Icons.close,
                    color: widget.tColor ?? Colors.black),
                onPressed: widget.onClosePressed,
              )
            : widget.sicon!=null?
            IconButton(
                icon: Icon( widget.sicon,
                    color: widget.tColor ?? Colors.black),
                onPressed: widget.onSearchPressed,
              ):SizedBox.shrink(),

        
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: GestureDetector(
            onTap: () {
          
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cartpage()),
              );
            },
            child: Stack(
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: widget.tColor ?? Colors.black,
                  size: 40,
                ),

               
                Positioned(
                  right: 0,
                  top: 0,
                  child: Consumer<CartProvider>(
                    builder: (context, value, child) {
                      if (value.cartItems.isEmpty) {
                        return const SizedBox();
                      }
                      return Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: Text(
                          value.cartItems.length.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                value.cartItems.length > 9 ? 10 : 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
