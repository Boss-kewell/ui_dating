import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List _images = [
      'assets/images/woman0.jpg',
      'assets/images/woman1.jpg',
      'assets/images/woman2.jpg',
      'assets/images/woman3.jpg',
      'assets/images/woman4.jpg',
      'assets/images/woman5.jpg',
      'assets/images/woman6.jpg',
      'assets/images/woman7.jpg',
    ];
    final List _name = [
      'Lisa',
      'Abigail',
      'Kemi',
      'Priyanka',
      'Remi',
      'Jane',
      'Patterson',
      'Nicki'
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Explore',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 23.0,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(Iconsax.heart),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        children: [
          const SizedBox(
            height: 20.0,
          ),
          SizedBox(
            height: 130.0,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Random().nextBool()
                              ? Colors.transparent
                              : Colors.pink.withOpacity(0.5),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 2.0,
                              spreadRadius: 0.0,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: CircleAvatar(
                            radius: 33.0,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 30.0,
                              backgroundImage: AssetImage(
                                _images[index],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        _name[index],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Near you',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 22.0,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          GridView.builder(
            shrinkWrap: true,
            itemCount: _images.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: AssetImage(
                        _images[index],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.8),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Text(
                              '${_name[index]}, 24',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Random().nextBool()
                                  ? Iconsax.heart
                                  : Icons.favorite,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
