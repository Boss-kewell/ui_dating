import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_dating/mainscreen.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: 
          ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
            background: const Color(0xfff3f4f9),
          ),
      ),
      home: const DisplayImage(),
    );
  }
}

