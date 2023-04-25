// import 'package:flutter/material.dart';

// class ContactCard extends StatefulWidget {
//   @override
//   _ContactCardState createState() => _ContactCardState();
// }

// class _ContactCardState extends State<ContactCard> {
//   bool _isNameSide = true;

//   void _toggleSide() {
//     setState(() {
//       _isNameSide = !_isNameSide;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             Colors.purple,
//             Colors.pink,
//           ],
//         ),
//       ),
//       child: Center(
//         child: GestureDetector(
//           onTap: _toggleSide,
//           child: SizedBox(
//             height: MediaQuery.of(context).size.height *
//                 0.9, // set height to half of the screen height
//             width: MediaQuery.of(context).size.width * 0.9,
//             child: Padding(
//               padding: const EdgeInsets.only(top: 48.0),
//               child: Card(
//                 elevation: 40.0,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 color: Colors.transparent,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.0),
//                     gradient: LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                       colors: [
//                         Colors.purple.shade300,
//                         Colors.pink.shade300,
//                       ],
//                     ),
//                   ),
//                   child: _isNameSide ? _buildNameSide() : _buildContactSide(),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     ));
//   }

//   Widget _buildNameSide() {
//     return Padding(
//       padding: EdgeInsets.all(20.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Name',
//             style: TextStyle(
//               fontSize: 20.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 10.0),
//           Text(
//             'John Doe',
//             style: TextStyle(fontSize: 18.0),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildContactSide() {
//     return Padding(
//       padding: EdgeInsets.all(20.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Contact',
//             style: TextStyle(
//               fontSize: 20.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 10.0),
//           Text(
//             'Email: john.doe@example.com\nPhone: +1 555-555-5555',
//             style: TextStyle(fontSize: 18.0),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// // import 'package:flutter/material.dart';

// // class ContactCard extends StatefulWidget {
// //   @override
// //   _ContactCardState createState() => _ContactCardState();
// // }

// // class _ContactCardState extends State<ContactCard> {
// //   int pageIndex = 0;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: Text("Page $pageIndex"),
// //       ),
// //       bottomNavigationBar: CurvedNavigationBar(
// //         backgroundColor: Colors.white,
// //         color: Colors.blue,
// //         items: [
// //           Icon(Icons.home),
// //           Icon(Icons.search),
// //           Icon(Icons.settings),
// //         ],
// //         onTap: (index) {
// //           setState(() {
// //             pageIndex = index;
// //           });
// //         },
// //       ),
// //     );
// //   }
// // }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:matrimony/repositories/user_respositories.dart';
import 'package:matrimony/route.dart';
import 'package:permission_handler/permission_handler.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  RegistrationScreenState createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // final userRepository = UserRepository();
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  final ageController = TextEditingController();
  // final genderController = TextEditingController();
  // final maritalStatusController = TextEditingController();
  // final religionController = TextEditingController();
  // final casteController = TextEditingController();
  final educationController = TextEditingController();
  final motherTongueController = TextEditingController();
  final languageKnownController = TextEditingController();
  final companyNameController = TextEditingController();
  final designationController = TextEditingController();
  final employmentTypeController = TextEditingController();
  final salaryController = TextEditingController();
  final countryController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final fatherNameController = TextEditingController();
  final fatherOccupationController = TextEditingController();
  final motherNameController = TextEditingController();
  final motherOccupationController = TextEditingController();
  final fatherCasteController = TextEditingController();
  final motherCasteController = TextEditingController();
  final familyOriginController = TextEditingController();
  final siblingsController = TextEditingController();
  final siblingsMarriedController = TextEditingController();
  final aboutMeController = TextEditingController();
  final aboutFamilyController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final complexionController = TextEditingController();
  final partnerAgeController = TextEditingController();
  final partnerHeightController = TextEditingController();
  final partnerWeightController = TextEditingController();
  final partnerCasteController = TextEditingController();
  final partnerReligionController = TextEditingController();
  final partnerEducationController = TextEditingController();
  final partnerOccupationController = TextEditingController();
  final partnerLanguageController = TextEditingController();
  final partnerAboutController = TextEditingController();

  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
  bool isButtonPressed = false;

  File? image;
  bool _isNameSide = true;

  void _toggleSide() {
    setState(() {
      _isNameSide = !_isNameSide;
    });
  }

  final List<String> genders = ['Male', 'Female'];
  String selectedGender = '';
  DateTime? selectedDate;
  final List<String> religions = ['Hindu', 'Muslim', 'Christian', 'Other'];
  String? selectedReligion;
  final List<String> castes = [
    'Brahmin',
    'Kshatriya',
    'Vaishya',
    'Shudra',
    'Others'
  ];
  String? selectedCaste;
  final List<String> maritalStatuses = [
    'Never Married',
    'Divorced',
    'Widowed',
  ];
  String? selectedMaritalStatus;
  final List<String> educations = [
    'High School',
    'Bachelor\'s Degree',
    'Master\'s Degree',
    'Doctorate'
  ];
  String? selectedEducation;
  final List<String> occupations = [
    'Software Engineer',
    'Doctor',
    'Lawyer',
    'Teacher'
  ];
  String? selectedOccupation;
  final List<String> incomes = [
    'Less than \$10,000',
    '\$10,000 - \$30,000',
    '\$30,000 - \$50,000',
    'More than \$50,000'
  ];
  String? selectedIncome;
  final List<String> countries = [
    'India',
    'USA',
    'UK',
    'Canada',
    'Other',
  ];
  String? selectedCountry;
  bool agreeToTerms = false;

  // Future<void> uploadImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   final permissionStatus = await Permission.storage.request();

  //   if (permissionStatus.isGranted) {
  //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  //     if (pickedFile != null) {
  //       setState(() {
  //         image = File(pickedFile.path);
  //       });

  //       // Send the image to the server using your API call
  //       try {
  //         // await userRepository.uploadImage(image!);
  //         Get.snackbar('Success', 'Image uploaded successfully!');
  //       } catch (e) {
  //         Get.snackbar('Error', 'Image upload failed. Error: $e');
  //       }
  //     }
  //   } else {
  //     // Permission is not granted, show error message
  //     Get.snackbar('Error', 'Permission not granted to access storage');
  //   }
  // }

  Future<void> pickImageAndUpload() async {
    final ImagePicker picker = ImagePicker();
    final permissionStatus = await Permission.storage.request();

    if (permissionStatus.isGranted) {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        // create multipart request for the image upload
        final request = http.MultipartRequest(
          'POST',
          Uri.parse('yourapiendpointhere'),
        );

        // attach the file to the request
        request.files.add(
          await http.MultipartFile.fromPath('image', image.path),
        );

        try {
          final response = await request.send();
          if (response.statusCode == 200) {
            // image uploaded successfully
            Get.snackbar('Success', 'Image uploaded successfully!');
          } else {
            // image upload failed
            Get.snackbar('Error',
                'Image upload failed with status code: ${response.statusCode}');
          }
        } catch (e) {
          Get.snackbar('Error', 'Image upload failed. Error: $e');
        }
      }
    } else {
      // Permission is not granted, show error message
      Get.snackbar('Error', 'Permission not granted to access storage');
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateOfBirthController.text =
            '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink.shade600,
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
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 58.0, left: 20, right: 20, bottom: 30),
              child: Card(
                elevation: 50.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.purple.shade300,
                        Colors.pink.shade300,
                      ],
                    ),
                  ),
                  child: _isNameSide
                      ? buildPersonal(context)
                      : buildPreference(context),
                ),
              ),
            ),
          ),
        ));
  }

  Widget buildPersonal(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'Create an Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    shadows: [
                      Shadow(
                        blurRadius: 5,
                        color: Colors.grey,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: pickImageAndUpload,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(50.0),
                primary: Colors.transparent,
                onPrimary: Colors.white,
              ),
              child: const Icon(Icons.add_a_photo),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(),
                prefixIcon: Icon(Icons.person, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone number',
                prefixIcon: Icon(Icons.phone, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
                controller: passwordController,
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon:
                      const Icon(Icons.lock_outline, color: Colors.white),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: confirmPasswordController,
              obscureText: !isConfirmPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                prefixIcon: const Icon(Icons.lock_outline, color: Colors.white),
                suffixIcon: IconButton(
                  icon: Icon(
                    isConfirmPasswordVisible
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      isConfirmPasswordVisible = !isConfirmPasswordVisible;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                } else if (value != passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: const Text(
                      'Male',
                    ),
                    activeColor: Colors.blue,
                    value: 'male',
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value.toString();
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: const Text(
                      'Female',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    activeColor: Colors.pink,
                    value: 'female',
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value.toString();
                      });
                    },
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                selectDate(context);
              },
              child: AbsorbPointer(
                child: TextField(
                  controller: dateOfBirthController,
                  decoration: const InputDecoration(
                    labelText: 'Date of Birth',
                    prefixIcon: Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField(
              value: selectedReligion,
              items: religions
                  .map((value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (selectedValue) {
                setState(() {
                  selectedReligion = selectedValue.toString();
                });
              },
              decoration: const InputDecoration(
                labelText: 'Religion',
                hintText: 'Select your religion',
                icon: Icon(Icons.category),
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField(
              value: selectedCaste,
              items: castes
                  .map((value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (selectedValue) {
                setState(() {
                  selectedCaste = selectedValue.toString();
                });
              },
              decoration: const InputDecoration(
                labelText: 'Caste',
                hintText: 'Select your caste',
                icon: Icon(Icons.category),
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField(
              value: selectedMaritalStatus,
              onChanged: (value) {
                setState(() {
                  selectedMaritalStatus = value;
                });
              },
              items: maritalStatuses.map((maritalStatuses) {
                return DropdownMenuItem(
                  value: maritalStatuses,
                  child: Text(maritalStatuses),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Martial Status',
                hintText: 'Select your Martial Status',
                icon: Icon(Icons.school),
              ),
            ),
            DropdownButtonFormField(
              value: selectedEducation,
              onChanged: (value) {
                setState(() {
                  selectedEducation = value;
                });
              },
              items: educations.map((education) {
                return DropdownMenuItem(
                  value: education,
                  child: Text(education),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Education',
                hintText: 'Select your highest education level',
                icon: Icon(Icons.school),
              ),
            ),
            DropdownButtonFormField(
              value: selectedOccupation,
              onChanged: (value) {
                setState(() {
                  selectedOccupation = value;
                });
              },
              items: occupations.map((occupation) {
                return DropdownMenuItem(
                  value: occupation,
                  child: Text(occupation),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Occupation',
                hintText: 'Select your current occupation',
                icon: Icon(Icons.work),
              ),
            ),
            DropdownButtonFormField(
              value: selectedIncome,
              onChanged: (value) {
                setState(() {
                  selectedIncome = value;
                });
              },
              items: incomes.map((income) {
                return DropdownMenuItem(
                  value: income,
                  child: Text(income),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Annual Income',
                hintText: 'Select your annual income',
                icon: Icon(Icons.attach_money),
              ),
            ),
            DropdownButtonFormField(
              value: selectedIncome,
              onChanged: (value) {
                setState(() {
                  selectedIncome = value;
                });
              },
              items: incomes.map((income) {
                return DropdownMenuItem(
                  value: income,
                  child: Text(income),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Annual Income',
                hintText: 'Select your annual income',
                icon: Icon(Icons.attach_money),
              ),
            ),
            TextField(
              controller: motherTongueController,
              decoration: const InputDecoration(
                labelText: 'Mother tongue',
              ),
            ),
            TextField(
              controller: languageKnownController,
              decoration: const InputDecoration(
                labelText: 'Language known',
              ),
            ),
            TextField(
              controller: companyNameController,
              decoration: const InputDecoration(
                labelText: 'Company name',
              ),
            ),
            TextField(
              controller: designationController,
              decoration: const InputDecoration(
                labelText: 'Designation',
              ),
            ),
            TextField(
              controller: stateController,
              decoration: const InputDecoration(
                labelText: 'State',
              ),
            ),
            TextField(
              controller: cityController,
              decoration: const InputDecoration(
                labelText: 'City',
              ),
            ),
            TextField(
              controller: fatherNameController,
              decoration: const InputDecoration(
                labelText: "Father's name",
              ),
            ),
            TextField(
              controller: fatherOccupationController,
              decoration: const InputDecoration(
                labelText: "Father's occupation",
              ),
            ),
            TextField(
              controller: motherNameController,
              decoration: const InputDecoration(
                labelText: "Mother's name",
              ),
            ),
            TextField(
              controller: motherOccupationController,
              decoration: const InputDecoration(
                labelText: "Mother's occupation",
              ),
            ),
            TextField(
              controller: fatherCasteController,
              decoration: const InputDecoration(
                labelText: "Father's caste",
              ),
            ),
            TextField(
              controller: motherCasteController,
              decoration: const InputDecoration(
                labelText: "Mother's caste",
              ),
            ),
            TextField(
              controller: familyOriginController,
              decoration: const InputDecoration(
                labelText: 'Family origin',
              ),
            ),
            TextField(
              controller: siblingsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Number of siblings',
              ),
            ),
            TextField(
              controller: siblingsMarriedController,
              decoration: const InputDecoration(
                labelText: 'Married',
              ),
            ),
            TextField(
              controller: aboutMeController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'About me',
              ),
            ),
            TextField(
              controller: aboutFamilyController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'About Family',
              ),
            ),
            TextField(
              controller: heightController,
              decoration: const InputDecoration(
                labelText: 'Height',
              ),
            ),
            TextField(
              controller: weightController,
              decoration: const InputDecoration(
                labelText: 'Weight',
              ),
            ),
            TextField(
              controller: complexionController,
              decoration: const InputDecoration(
                labelText: 'Complexion',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MaterialButton(
                onPressed: () {
                  _toggleSide();
                },
                minWidth: double.infinity,
                height: 50,
                color: Colors.pink[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPreference(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            TextField(
              controller: partnerAgeController,
              decoration: const InputDecoration(
                labelText: "Partner's age",
              ),
            ),
            TextField(
              controller: partnerHeightController,
              decoration: const InputDecoration(
                labelText: "Partner's height",
              ),
            ),
            TextField(
              controller: partnerWeightController,
              decoration: const InputDecoration(
                labelText: "Partner's weight",
              ),
            ),
            TextField(
              controller: partnerCasteController,
              decoration: const InputDecoration(
                labelText: "Partner's caste",
              ),
            ),
            TextField(
              controller: partnerReligionController,
              decoration: const InputDecoration(
                labelText: "Partner's religion",
              ),
            ),
            TextField(
              controller: partnerEducationController,
              decoration: const InputDecoration(
                labelText: "Partner's education",
              ),
            ),
            TextField(
              controller: partnerOccupationController,
              decoration: const InputDecoration(
                labelText: "Partner's occupation",
              ),
            ),
            TextField(
              controller: partnerLanguageController,
              decoration: const InputDecoration(
                labelText: "Partner's language",
              ),
            ),
            TextField(
              controller: partnerAboutController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Partner's about",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: MaterialButton(
                onPressed: () async {
                  // Add animation to the button
                  setState(() {
                    isButtonPressed = true;
                  });

                  // Wait for a few seconds to simulate a delay
                  await Future.delayed(const Duration(seconds: 2));

                  // Navigate to the home screen
                  Get.toNamed(AppRoutes.home);
                },
                minWidth: double.infinity,
                height: 50,
                color: Colors.pink[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: isButtonPressed
                      ? const Icon(Icons.done, color: Colors.white)
                      : const Text('Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> submitForm() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();

      // Check for empty fields
      if (nameController.text.isEmpty ||
          phoneNumberController.text.isEmpty ||
          passwordController.text.isEmpty ||
          dateOfBirthController.text.isEmpty ||
          ageController.text.isEmpty ||
          // genderController.text.isEmpty ||
          // maritalStatusController.text.isEmpty ||
          // religionController.text.isEmpty ||
          // casteController.text.isEmpty ||
          educationController.text.isEmpty ||
          motherTongueController.text.isEmpty ||
          languageKnownController.text.isEmpty ||
          companyNameController.text.isEmpty ||
          designationController.text.isEmpty ||
          employmentTypeController.text.isEmpty ||
          salaryController.text.isEmpty ||
          countryController.text.isEmpty ||
          stateController.text.isEmpty ||
          cityController.text.isEmpty ||
          fatherNameController.text.isEmpty ||
          fatherOccupationController.text.isEmpty ||
          motherNameController.text.isEmpty ||
          motherOccupationController.text.isEmpty ||
          fatherCasteController.text.isEmpty ||
          motherCasteController.text.isEmpty ||
          familyOriginController.text.isEmpty ||
          siblingsController.text.isEmpty ||
          siblingsMarriedController.text.isEmpty ||
          aboutMeController.text.isEmpty ||
          aboutFamilyController.text.isEmpty ||
          heightController.text.isEmpty ||
          weightController.text.isEmpty ||
          complexionController.text.isEmpty ||
          partnerAgeController.text.isEmpty ||
          partnerHeightController.text.isEmpty ||
          partnerWeightController.text.isEmpty ||
          partnerCasteController.text.isEmpty ||
          partnerReligionController.text.isEmpty ||
          partnerEducationController.text.isEmpty ||
          partnerOccupationController.text.isEmpty ||
          partnerLanguageController.text.isEmpty ||
          partnerAboutController.text.isEmpty) {
        // Show an error message
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please fill all fields'),
        ));
        return;
      }

      final url = Uri.parse('https://your-api.com/register');

      try {
        final response = await http.post(url, body: {
          'name': nameController.text,
          'phoneNumber': phoneNumberController.text,
          'dateOfBirth': dateOfBirthController.text,
          'age': ageController.text,
          // 'gender': genderController.text,
          // 'maritalStatus': maritalStatusController.text,
          // 'religion': religionController.text,
          // 'caste': casteController.text,
          'education': educationController.text,
          'motherTongue': motherTongueController.text,
          'languageKnown': languageKnownController.text,
          'companyName': companyNameController.text,
          'designation': designationController.text,
          'employmentType': employmentTypeController.text,
          'salary': salaryController.text,
          'country': countryController.text,
          'state': stateController.text,
          'city': cityController.text,
          'fatherName': fatherNameController.text,
          'fatherOccupation': fatherOccupationController.text,
          'motherName': motherNameController.text,
          'motherOccupation': motherOccupationController.text,
          'fatherCaste': fatherCasteController.text,
          'motherCaste': motherCasteController.text,
          'familyOrigin': familyOriginController.text,
          'siblings': siblingsController.text,
          'siblingsMarried': siblingsMarriedController.text,
          'aboutMe': aboutMeController.text,
          'aboutFamily': aboutFamilyController.text,
          'height': heightController.text,
          'weight': weightController.text,
          'complexion': complexionController.text,
          'partnerAge': partnerAgeController.text,
          'partnerHeight': partnerHeightController.text,
          'partnerWeight': partnerWeightController.text,
          'partnerCaste': partnerCasteController.text,
          'partnerReligion': partnerReligionController.text,
          'partnerEducation': partnerEducationController.text,
          'partnerOccupation': partnerOccupationController.text,
          'partnerLanguage': partnerLanguageController.text,
          'partnerAbout': partnerAboutController.text,
        });

        if (response.statusCode == 200) {
          // Registration successful
          Get.toNamed(AppRoutes.home);
          // Get.to(HomeScreen());
        } else {
          // Registration failed
          // Handle the error
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Registration failed. Please try again.'),
          ));
        }
      } catch (e) {
        // Handle the error
        // Registration failed, show error message
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Error'),
        ));
      }
    }
  }
}
