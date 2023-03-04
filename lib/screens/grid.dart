import 'package:flutter/material.dart';
import 'package:ecommerece/model/model.dart';

class GridItem extends StatelessWidget {
  final Item item;

  const GridItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'item-screen', arguments: item);
      },
      child: GridTile(
          footer: Container(
            decoration: BoxDecoration(
                color: Colors.black, border: Border.all(color: Colors.black)),
            child: Text(
              item.title,
              softWrap: true,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          child: Image.network(
            item.imageUrl,
            fit: BoxFit.scaleDown,
          )),
    );
  }
}
