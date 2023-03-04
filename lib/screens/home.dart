// ignore_for_file: prefer_const_constructors
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerece/screens/account.dart';
import 'package:ecommerece/screens/allitems.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'categories.dart';
import 'wishlist.dart';
import 'package:marquee/marquee.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  List<String> topoffers = [
    'https://images.samsung.com/in/smartphones/galaxy-s23-ultra/images/galaxy-s23-ultra-highlights-colors-green-back-s.jpg',
    'https://rukminim1.flixcart.com/image/416/416/kljrvrk0/cookie-biscuit/w/1/z/fruit-biscuits-karachi-bakery-original-imagyn7dbyj7ab8r.jpeg?q=70',
    'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/w/r/o/-original-imagka2mzcgdh3qf.jpeg?q=70',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.red[700]),
                child: Text(
                  'Hello User',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                )),
            ListTile(
              title: const Text('My Account'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyAccount()));
              },
            ),
            ListTile(
              title: const Text('Categories'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Categories()));
              },
            ),
            ListTile(
              title: const Text('Wishlist'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Wishlist()));
              },
            ),
            Container(
              color: Colors.grey,
              child: ListTile(
                title: const Text(
                  'Sign-Out',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                },
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        centerTitle: true,
        title: Image.asset(
          'assets/images/appstore.png',
          fit: BoxFit.cover,
          height: 45,
          width: 65,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200,
                aspectRatio: 16 / 9,
                viewportFraction: 0.9,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
              items: [1, 2, 3, 4].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image(
                            image: AssetImage('assets/images/image$i.jpg')));
                  },
                );
              }).toList(),
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 30,
              child: Marquee(
                text: 'BEST OFFERS ARE AVAILABLE HERE',
                style: TextStyle(fontWeight: FontWeight.bold),
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                blankSpace: 20.0,
                velocity: 100.0,
                pauseAfterRound: Duration(milliseconds: 25),
                startPadding: 10.0,
                accelerationDuration: Duration(seconds: 3),
                accelerationCurve: Curves.easeInOut,
                decelerationDuration: Duration(seconds: 1),
                decelerationCurve: Curves.easeInOut,
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
            width: 300,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllItems()),
                  );
                },
                child: Text(
                  "All Items",
                  style: TextStyle(fontSize: 20),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
            child: SizedBox(
              height: 30,
              child: Marquee(
                text: '!!! TOP OFFERS !!!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                blankSpace: 20.0,
                velocity: 85.0,
                pauseAfterRound: Duration.zero,
                startPadding: 10.0,
                accelerationDuration: Duration.zero,
                accelerationCurve: Curves.linear,
                decelerationDuration: Duration.zero,
                decelerationCurve: Curves.linear,
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: 200,
              child: PageView.builder(
                itemCount: 3,
                controller: PageController(viewportFraction: 0.8),
                onPageChanged: (int index) => setState(() => _index = index),
                itemBuilder: (_, i) {
                  return Transform.scale(
                    scale: i == _index ? 1 : 0.9,
                    child: GestureDetector(
                      onTap: () {},
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(child: Image.network(topoffers[i])),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
