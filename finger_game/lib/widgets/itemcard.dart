import 'package:flutter/material.dart';
import '../constraints.dart';
import '../models/product.dart';
class Itemcard extends StatelessWidget {
 final Product products;
 final VoidCallback press;

  const Itemcard({super.key, required this.products, required this.press});
  @override
  Widget build(BuildContext context) {
    final  size= MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding/4),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              // margin: EdgeInsets.all(kPadding),
              padding: EdgeInsets.all(kPadding),
               width: size.width/2.5,
               height: size.height/6,
              decoration: BoxDecoration(
                color: products.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(products.image),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.1),
              child: Text(
                products.name,
                style: TextStyle(color: kTextColor),
              ),
            ),
            Text(
              products.price.toString(),
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}