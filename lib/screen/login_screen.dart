import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:matrimony/models/user.dart';
import 'package:matrimony/repositories/user_respositories.dart';
import 'package:matrimony/route.dart';
import 'package:matrimony/screen/registration_screen/registration_screen.dart';
import 'package:matrimony/screen/sample.dart';
import 'package:matrimony/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  // final userRepository = UserRepository();

  final formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;

  Future<void> login() async {
    // Validate phone number
    final phoneNumber = phoneNumberController.text;
    if (phoneNumber.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter phone number',
        colorText: Colors.white,
        barBlur: 17,
      );
      return;
    }
    final phoneRegex = RegExp(r'^\d{10}$');
    if (!phoneRegex.hasMatch(phoneNumber)) {
      Get.snackbar(
        'Error',
        'Invalid phone number',
        colorText: Colors.white,
        barBlur: 17,
      );
      return;
    }

    // Validate password
    final password = passwordController.text;
    if (password.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter password',
        colorText: Colors.white,
        barBlur: 17,
      );
      return;
    } else {
      Get.toNamed(AppRoutes.home);
    }

    // Make API call to login

    //   const url = 'your_api_endpoint_here';
    //   final response = await http.post(Uri.parse(url), body: {
    //     'phoneNumber': phoneNumber,
    //     'password': password,
    //   });
    //   final responseData = json.decode(response.body);
    //   if (response.statusCode == 200) {
    //     final user = responseData != null ? User.fromJson(responseData) : null;
    //     if (user != null && user.isNewUser) {
    //       Get.snackbar('New User', 'Please register to continue');
    //     } else if (user != null) {
    //       // store user data in secure storage
    //       // navigate to home screen
    //       // Get.offAll(HomeScreen(user: user));
    //     } else {
    //       Get.snackbar('Error', 'Invalid response data');
    //     }
    //   } else {
    //     final message =
    //         responseData != null ? responseData['message'] : 'Unknown error';
    //     Get.snackbar('Error', message);
    //   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.purple,
              Colors.pink,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            const Icon(
              Icons.favorite_border,
              size: 80,
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Welcome!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.2),
                  hintText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                ),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                obscureText: !isPasswordVisible,
                controller: passwordController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.2),
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(
                    Icons.lock_outlined,
                    color: Colors.white,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                ),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MaterialButton(
                onPressed: () {
                  login();
                },
                minWidth: double.infinity,
                height: 50,
                color: Colors.pink[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationScreen()),
                );
              },
              child: const Text(
                'Don\'t have an account yet? Register now!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
