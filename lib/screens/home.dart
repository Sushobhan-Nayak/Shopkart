// ignore_for_file: prefer_const_constructors
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerece/screens/account.dart';
import 'package:ecommerece/screens/allitems.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 30,
              child: Marquee(
                text: 'BEST OFFERS ARE AVAILABLE HERE',
                style: TextStyle(fontWeight: FontWeight.bold),
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
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: 30,
              child: Marquee(
                text: '!!! TOP OFFERS !!!',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
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
          Card(
            c
          )
        ],
      ),
    );
  }
}
