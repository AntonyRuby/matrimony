// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class EditProfileScreen extends StatefulWidget {
//   final int userId;

//   const EditProfileScreen({super.key, required this.userId});

//   @override
//   _EditProfileScreenState createState() => _EditProfileScreenState();
// }

// class _EditProfileScreenState extends State<EditProfileScreen> {
//   late TextEditingController nameController;
//   late TextEditingController ageController;
//   late TextEditingController emailController;

//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserData();
//   }

//   void _fetchUserData() async {
//     final response = await http
//         .get(Uri.parse('https://api.example.com/users/${widget.userId}'));

//     if (response.statusCode == 200) {
//       final userData = jsonDecode(response.body);

//       setState(() {
//         nameController = TextEditingController(text: userData['name']);
//         ageController = TextEditingController(text: userData['age'].toString());
//         emailController = TextEditingController(text: userData['email']);
//         isLoading = false;
//       });
//     } else {
//       // Handle errors
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Profile'),
//       ),
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Form(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     TextFormField(
//                       controller: nameController,
//                       decoration: const InputDecoration(labelText: 'Name'),
//                     ),
//                     TextFormField(
//                       controller: ageController,
//                       decoration: const InputDecoration(labelText: 'Age'),
//                     ),
//                     TextFormField(
//                       controller: emailController,
//                       decoration: const InputDecoration(labelText: 'Email'),
//                     ),
//                     const SizedBox(height: 16.0),
//                     ElevatedButton(
//                       onPressed: () {
//                         // Implement update logic
//                       },
//                       child: const Text('Update'),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }
// }
