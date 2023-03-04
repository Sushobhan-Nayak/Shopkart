import 'package:ecommerece/data/data.dart';
import 'package:flutter/material.dart';
import 'grid.dart';
import 'package:ecommerece/model/model.dart';

class AllItems extends StatefulWidget {
  const AllItems({super.key});

  @override
  State<AllItems> createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {
  final List<Item> items = dummyItems;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red[900],
        title: const Text("All Items"),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.white,
        child: GridView.builder(
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                childAspectRatio: 1.5,
                crossAxisSpacing: 15,
                mainAxisSpacing: 18),
            itemBuilder: (context, index) {
              return GridItem(item: items[index]);
            }),
      ),
    );
  }
}
