import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
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
  void initState() {
    // Corrected typo here
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
              child: GNav(
                backgroundColor: Colors.white,
                selectedIndex: _currentIndex!,
                activeColor: Colors.red,
                curve: Curves.easeIn,
                onTabChange: navigationTapped,
                tabs: const [
                  GButton(
                    icon: Iconsax.home,
                    text: '  Home',
                  ),
                  GButton(
                    icon: Iconsax.search_normal,
                    text: '  Search',
                  ),
                  GButton(
                    icon: Iconsax.message,
                    text: '  Messages',
                  ),
                  GButton(
                    icon: Iconsax.setting,
                    text: '  Settings',
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
