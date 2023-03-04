import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final List<int> colorCodes = <int>[600, 100, 300, 900];
  List<String> catlist = ['Electronics', 'Fashion', 'Grocery', 'Home'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        centerTitle: true,
        title: const Text("CATEGORIES"),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: catlist.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){},
              child: Container(
                height: 120,
                color: Colors.amber[colorCodes[index]],
                child: Center(
                    child: Text(
                  catlist[index],
                  style: const TextStyle(fontSize: 20),
                )),
              ),
            );
          }),
    );
  }
}
