import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrimony/route.dart';
import 'package:matrimony/screen/home_screen/home_screen.dart';
import 'package:matrimony/screen/login_screen.dart';
import 'package:matrimony/screen/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Matrimony',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const LoginScreen(),
      getPages: [
        GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
        GetPage(
            name: AppRoutes.profile,
            page: () => const ProfileScreen(
                  user: {},
                )),
      ],
    );
  }
}
