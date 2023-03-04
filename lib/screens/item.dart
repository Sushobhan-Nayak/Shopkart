// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ecommerece/model/model.dart';

class ItemScreen extends StatefulWidget {
  static const routeName = 'item-screen';
  const ItemScreen({Key? key}) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
                    setState(() {
                      toggle = !toggle;
                    });
                  },
            icon: (toggle)
                ? Icon(
                    Icons.favorite,
                    color: Colors.green,
                  )
                : Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
            tooltip: 'To Favorite',
          )
        ],
        backgroundColor: Colors.red[900],
        title: Text(item.title),
        centerTitle: true,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                  height: 250, width: 250, child: Image.network(item.imageUrl)),
            ),
            Divider(
              color: Colors.red[900],
              thickness: 1,
            ),
            SizedBox(
              child: Text(
                item.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              child: Text(
                "Ratings - ${item.ratings} / 5",
                style: const TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(
              child: Text(
                "Price - ${item.cost}",
                style: const TextStyle(fontSize: 15),
              ),
            ),
            Divider(
              color: Colors.red[900],
              thickness: 1,
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: item.specifications.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(12)),
                      height: 30,
                      child: Center(
                          child: Text(
                        item.specifications[index],
                        style: TextStyle(fontSize: 15),
                      )),
                    );
                  }),
            )
          ]),
    );
  }
}
