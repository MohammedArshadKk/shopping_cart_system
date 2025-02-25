import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_cart_system/views/products/products_screen.dart';
import 'package:shopping_cart_system/views/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: AppBarTheme(
          toolbarHeight: 100,
          iconTheme: IconThemeData(color: AppColors.background),
          titleTextStyle: TextStyle(
            color: AppColors.background,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        textTheme: GoogleFonts.montserratTextTheme(),
        iconTheme: IconThemeData(color: AppColors.background),
        iconButtonTheme: IconButtonThemeData(),
      ),
      home: ProductsScreen(),
    );
  }
}
