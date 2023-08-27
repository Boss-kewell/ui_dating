import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_dating/pages/home_page.dart';

class DisplayImage extends StatefulWidget {
  const DisplayImage({super.key});

  @override
  State<DisplayImage> createState() => _DisplayImageState();
}

class _DisplayImageState extends State<DisplayImage> {
  int? _currentIndex = 0;
  PageController? pageController;

  @override
  void initSate() {
    super.initState();
    pageController = PageController(initialPage: _currentIndex!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
        children: [
          HomePage(),
          Center(child: Text('2')),
          Center(child: Text('3')),
          Center(child: Text('4')),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40.0),
              child: BottomNavyBar(
                // containerHeight: 45,
                selectedIndex: _currentIndex!,
                showElevation: false,
                itemCornerRadius: 24,
                curve: Curves.easeIn,
                onItemSelected: navigationTapped,
                items: <BottomNavyBarItem>[
                  BottomNavyBarItem(
                    icon: const Icon(Iconsax.home),
                    title: const Text('Home'),
                    activeColor: Colors.red,
                    textAlign: TextAlign.center,
                  ),
                  BottomNavyBarItem(
                    icon: const Icon(Iconsax.search_normal),
                    title: const Text('Search'),
                    activeColor: Colors.purpleAccent,
                    textAlign: TextAlign.center,
                  ),
                  BottomNavyBarItem(
                    icon: const Icon(Iconsax.message),
                    title: const Text(
                        'Message'
                    ),
                    activeColor: Colors.pink,
                    textAlign: TextAlign.center,
                  ),
                  BottomNavyBarItem(
                    icon: const Icon(Iconsax.settings),
                    title: const Text('Settings'),
                    activeColor: Colors.blue,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  void navigationTapped(int page) {
    pageController!.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _currentIndex = page;
    });
  }

  @override
  void dispose() {
    pageController?.dispose();
    super.dispose();
  }
}
