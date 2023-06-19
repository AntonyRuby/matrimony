import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:matrimony/repositories/user_respositories.dart';
import 'package:matrimony/route.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';

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

  final companyNameController = TextEditingController();
  final designationController = TextEditingController();

  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final fatherNameController = TextEditingController();
  final motherNameController = TextEditingController();
  final languageKnownController = TextEditingController();

  final familyOriginController = TextEditingController();

  final aboutMeController = TextEditingController();
  final aboutFamilyController = TextEditingController();
  final partnerAgeController = TextEditingController();
  final partnerHeightController = TextEditingController();
  final partnerWeightController = TextEditingController();
  final partnerCasteController = TextEditingController();
  final partnerReligionController = TextEditingController();
  final partnerEducationController = TextEditingController();
  final partnerOccupationController = TextEditingController();
  final partnerLanguageController = TextEditingController();
  final partnerAboutController = TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
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

  final List<String> partnerReligions = ['Hindu', 'Muslim', 'Christian', 'Any'];
  String? selectedPartnerReligion;

  final List<String> castes = [
    'Brahmin',
    'Kshatriya',
    'Vaishya',
    'Shudra',
    'Jat',
    'Gujjar',
    'Rajput',
    'Maratha',
    'Bania',
    'Kamma',
    'Kapu',
    'Reddy',
    'Yadav',
    'Mudaliar',
    'Gounder',
    'Chettiar',
    'Vellalar',
    'Pillai',
    'Nadar',
    'Adi Dravidar',
    'Iyer',
    'Iyengar',
    'Nair',
    'Ezhava',
    'Thiyya',
    'Malayali',
    'Devar',
    'Mukkulathor',
    'Parkavakulam',
    'Pallan',
    'Vanniyar',
    'Kongu Vellalar',
    'Naidu',
    'Reddiar',
    'Thevar',
    'Udayar',
    'Vannar',
    'Other'
  ];

  void sortCastes() {
    castes.sort();
  }

  String? selectedCaste;

  final List<String> partnerCastes = [
    'Brahmin',
    'Kshatriya',
    'Vaishya',
    'Shudra',
    'Jat',
    'Gujjar',
    'Rajput',
    'Maratha',
    'Bania',
    'Kamma',
    'Kapu',
    'Reddy',
    'Yadav',
    'Mudaliar',
    'Gounder',
    'Chettiar',
    'Vellalar',
    'Pillai',
    'Nadar',
    'Adi Dravidar',
    'Iyer',
    'Iyengar',
    'Nair',
    'Ezhava',
    'Thiyya',
    'Malayali',
    'Devar',
    'Mukkulathor',
    'Parkavakulam',
    'Pallan',
    'Vanniyar',
    'Kongu Vellalar',
    'Naidu',
    'Reddiar',
    'Thevar',
    'Udayar',
    'Vannar',
    'Any'
  ];
  void sortPartnerCastes() {
    partnerCastes.sort();
  }

  Set<String> selectedPartnerCaste = {};

  final List<String> maritalStatuses = [
    'Never Married',
    'Divorced',
    'Widowed',
  ];
  String? selectedMaritalStatus;

  final List<String> educations = [
    'High School',
    'Diploma',
    'Bachelor\'s Degree',
    'Master\'s Degree',
    'Doctorate',
  ];
  String? selectedEducation;

  final List<String> partnerEducations = [
    'High School',
    'Diploma',
    'Bachelor\'s Degree',
    'Master\'s Degree',
    'Doctorate',
  ];
  Set<String> selectedPartnerEducation = {};

  final List<String> occupations = [
    'Software Engineer',
    'Doctor',
    'Lawyer',
    'Teacher',
    'Engineer',
    'Accountant',
    'Business Owner',
    'Marketing Executive',
    'Journalist',
    'Architect',
    'Artist',
    'Chef',
    'Pilot',
    'Scientist',
    'Athlete',
    'Politician',
    'Police Officer',
    'Firefighter',
    'Soldier',
    'Actor',
    'Musician',
    'Writer',
    'Other'
  ];

  String? selectedOccupation;

  final List<String> fatherOccupations = [
    'Software Engineer',
    'Doctor',
    'Lawyer',
    'Teacher',
    'Engineer',
    'Accountant',
    'Business Owner',
    'Marketing Executive',
    'Journalist',
    'Architect',
    'Artist',
    'Chef',
    'Pilot',
    'Scientist',
    'Athlete',
    'Politician',
    'Police Officer',
    'Firefighter',
    'Soldier',
    'Actor',
    'Musician',
    'Writer',
    'Other'
  ];

  String? selectedFatherOccupation;

  final List<String> motherOccupations = [
    'Software Engineer',
    'Doctor',
    'Lawyer',
    'Teacher',
    'Engineer',
    'Accountant',
    'Business Owner',
    'Marketing Executive',
    'Journalist',
    'Architect',
    'Artist',
    'Chef',
    'Pilot',
    'Scientist',
    'Athlete',
    'Politician',
    'Police Officer',
    'Firefighter',
    'Soldier',
    'Actor',
    'Musician',
    'Writer',
    'Housemaker'
        'Other'
  ];

  void sortMotherOccupation() {
    motherOccupations.sort();
  }

  String? selectedMotherOccupation;

  final List<String> partnerOccupations = [
    'Software Engineer',
    'Doctor',
    'Lawyer',
    'Teacher',
    'Engineer',
    'Accountant',
    'Business Owner',
    'Marketing Executive',
    'Journalist',
    'Architect',
    'Artist',
    'Chef',
    'Pilot',
    'Scientist',
    'Athlete',
    'Politician',
    'Police Officer',
    'Firefighter',
    'Soldier',
    'Actor',
    'Musician',
    'Writer',
    'Other',
    'Any'
  ];
  Set<String> selectedPartnerOccupation = {};

  final List<String> incomes = [
    'Less than \$10,000',
    '\$10,000 - \$20,000',
    '\$20,000 - \$30,000',
    '\$30,000 - \$40,000',
    '\$40,000 - \$50,000',
    '\$50,000 - \$75,000',
    '\$75,000 - \$100,000',
    '\$100,000 - \$150,000',
    'More than \$150,000'
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

  final List<String> motherTongue = [
    'Assamese',
    'Bengali',
    'Bodo',
    'Dogri',
    'Gujarati',
    'Hindi',
    'Kannada',
    'Kashmiri',
    'Konkani',
    'Maithili',
    'Malayalam',
    'Manipuri',
    'Marathi',
    'Nepali',
    'Odia',
    'Punjabi',
    'Sanskrit',
    'Santali',
    'Sindhi',
    'Tamil',
    'Telugu',
    'Urdu',
    'Other'
  ];

  void sortMotherTongue() {
    motherTongue.sort();
  }

  String? selectedMotherTongue;

  bool agreeToTerms = false;

  final List<String> languagesKnown = [
    'Hindi',
    'Bengali',
    'Telugu',
    'Marathi',
    'Tamil',
    'Gujarati',
    'Urdu',
    'Kannada',
    'Odia',
    'Punjabi',
    'Malayalam',
    'Assamese',
    'Kashmiri',
    'Sindhi',
    'Sanskrit',
    'English',
    'French',
    'Other'
  ];

  void sortLanguageKnown() {
    languagesKnown.sort();
  }

  Set<String> selectedLanguageKnown = {};

  final List<String> partnerLanguages = [
    'Hindi',
    'Bengali',
    'Telugu',
    'Marathi',
    'Tamil',
    'Gujarati',
    'Urdu',
    'Kannada',
    'Odia',
    'Punjabi',
    'Malayalam',
    'Assamese',
    'Kashmiri',
    'Sindhi',
    'Sanskrit',
    'English',
    'French',
    'Other'
  ];

  Set<String> selectedPartnerLanguages = {};

  final List<String> complexion = [
    'Fair',
    'Light',
    'Medium',
    'Olive',
    'Dark',
    'Very dark'
  ];
  String? selectedComplexion;

  Set<String> selectedComplexions = {};

  final List<String> numberofSiblings = [
    'None',
    '1',
    '2',
    '3',
    '4',
    '5 or more',
  ];
  String? selectednumberofSiblings;

  final List<String> numberofSiblingsMarried = [
    'None',
    '1',
    '2',
    '3',
    '4',
    '5 or more',
  ];
  String? selectednumberofSiblingsMarried;

  final List<String> height = [
    '4\'0"',
    '4\'1"',
    '4\'2"',
    '4\'3"',
    '4\'4"',
    '4\'5"',
    '4\'6"',
    '4\'7"',
    '4\'8"',
    '4\'9"',
    '4\'10"',
    '4\'11"',
    '5\'0"',
    '5\'1"',
    '5\'2"',
    '5\'3"',
    '5\'4"',
    '5\'5"',
    '5\'6"',
    '5\'7"',
    '5\'8"',
    '5\'9"',
    '5\'10"',
    '5\'11"',
    '6\'0"',
    '6\'1"',
    '6\'2"',
    '6\'3"',
    '6\'4"',
    '6\'5"',
    '6\'6"',
    '6\'7"',
    '6\'8"',
    '6\'9"',
    '6\'10"',
    '6\'11"',
    '7\'0"',
    '7\'1"',
    '7\'2"',
    '7\'3"',
    '7\'4"',
    '7\'5"',
    '7\'6"',
    '7\'7"',
    '7\'8"',
    '7\'9"',
    '7\'10"',
    '7\'11"',
    '8\'0"',
  ];

  String? selectedHeight;

  final List<String> weight = [
    'Less than 50 kg',
    '50 - 60 kg',
    '60 - 70 kg',
    '70 - 80 kg',
    '80 - 90 kg',
    '90 - 100 kg',
    'More than 100 kg',
  ];
  String? selectedWeight;

  final List<String> fatherCaste = [
    'Brahmin',
    'Kshatriya',
    'Vaishya',
    'Shudra',
    'Jat',
    'Gujjar',
    'Rajput',
    'Maratha',
    'Bania',
    'Kamma',
    'Kapu',
    'Reddy',
    'Yadav',
    'Mudaliar',
    'Gounder',
    'Chettiar',
    'Vellalar',
    'Pillai',
    'Nadar',
    'Adi Dravidar',
    'Iyer',
    'Iyengar',
    'Nair',
    'Ezhava',
    'Thiyya',
    'Malayali',
    'Devar',
    'Mukkulathor',
    'Parkavakulam',
    'Pallan',
    'Vanniyar',
    'Kongu Vellalar',
    'Naidu',
    'Reddiar',
    'Thevar',
    'Udayar',
    'Vannar',
    'Other'
  ];
  String? selectedFatherCaste;

  final List<String> motherCaste = [
    'Brahmin',
    'Kshatriya',
    'Vaishya',
    'Shudra',
    'Jat',
    'Gujjar',
    'Rajput',
    'Maratha',
    'Bania',
    'Kamma',
    'Kapu',
    'Reddy',
    'Yadav',
    'Mudaliar',
    'Gounder',
    'Chettiar',
    'Vellalar',
    'Pillai',
    'Nadar',
    'Adi Dravidar',
    'Iyer',
    'Iyengar',
    'Nair',
    'Ezhava',
    'Thiyya',
    'Malayali',
    'Devar',
    'Mukkulathor',
    'Parkavakulam',
    'Pallan',
    'Vanniyar',
    'Kongu Vellalar',
    'Naidu',
    'Reddiar',
    'Thevar',
    'Udayar',
    'Vannar',
    'Other'
  ];
  String? selectedMotherCaste;

  String? selectedAge;

  List<String> age = List.generate(20, (index) => "${index + 21}")
    ..add("Above 40");

  RangeValues ageRange = const RangeValues(18, 30);
  TextEditingController minAgeController = TextEditingController(text: '18');
  TextEditingController maxAgeController = TextEditingController(text: '30');

  RangeValues heightRange = const RangeValues(120, 200);
  TextEditingController minHeightController =
      TextEditingController(text: '120');
  TextEditingController maxHeightController =
      TextEditingController(text: '200');

  RangeValues weightRange = const RangeValues(40, 120);
  TextEditingController minWeightController = TextEditingController(text: '40');
  TextEditingController maxWeightController =
      TextEditingController(text: '120');

  File? _imageFile;

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
            // read the response body and convert it to a string
            final String responseString = await response.stream.bytesToString();
            // image uploaded successfully
            Get.snackbar('Success', 'Image uploaded successfully!');
            setState(() {
              _imageFile = File(image.path);
            });
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

  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _saveImage() async {
    if (_image != null) {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/my_image.jpg');
      await file.writeAsBytes(await _image!.readAsBytes());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Image saved successfully!')),
      );
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
        body: Form(
      key: formKey,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 58.0, left: 20, right: 20, bottom: 30),
        child: Card(
          elevation: 50.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          child:
              _isNameSide ? buildPersonal(context) : buildPreference(context),
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
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 18,
                ),
                const Text(
                  'Create an Account',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
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
              onPressed: () => _pickImage(ImageSource.gallery),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                primary: Colors.transparent,
                onPrimary: Colors.black,
              ),
              child: SizedBox(
                width: 100.0,
                height: 100.0,
                child: _image != null
                    ? Image.file(_image!, fit: BoxFit.cover)
                    : const Icon(Icons.add_a_photo),
              ),
            ),

            // ElevatedButton(
            //   onPressed: pickImageAndUpload,
            //   style: ElevatedButton.styleFrom(
            //     shape: const CircleBorder(),
            //     padding: const EdgeInsets.all(50.0),
            //     primary: Colors.transparent,
            //     onPrimary: Colors.black,
            //   ),
            //   child: _imageFile == null
            //       ? const Icon(Icons.add_a_photo)
            //       : Image.file(_imageFile!),
            // ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(),
                prefixIcon: Icon(Icons.person, size: 16),
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
                prefixIcon: Icon(Icons.phone, size: 16),
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
                  prefixIcon: const Icon(Icons.lock_outline, size: 16),
                  suffixIcon: IconButton(
                    icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: 16),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                )),
            const SizedBox(height: 10),
            TextFormField(
              controller: confirmPasswordController,
              obscureText: !isConfirmPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                prefixIcon: const Icon(Icons.lock_outline, size: 16),
                suffixIcon: IconButton(
                  icon: Icon(
                      isConfirmPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 16),
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
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
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
                        fontSize: 12.0,
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
                    prefixIcon: Icon(Icons.calendar_month_outlined, size: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Age',
                hintText: 'Select',
              ),
              value: selectedAge,
              onChanged: (String? newValue) {
                setState(() {
                  selectedAge = newValue;
                });
              },
              items: age.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
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
              // icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
              decoration: const InputDecoration(
                labelText: 'Religion',
                hintText: 'Select your religion',
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
              ),
            ),
            const SizedBox(height: 10),
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
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField(
              value: selectedCountry,
              items: countries
                  .map((value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (selectedValue) {
                setState(() {
                  selectedCountry = selectedValue.toString();
                });
              },
              decoration: const InputDecoration(
                labelText: 'Country',
                hintText: 'Select',
              ),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: stateController,
              decoration: const InputDecoration(
                labelText: 'State',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: cityController,
              decoration: const InputDecoration(
                labelText: 'City',
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField(
              value: selectedHeight,
              items: height
                  .map((value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (selectedValue) {
                setState(() {
                  selectedHeight = selectedValue.toString();
                });
              },
              decoration: const InputDecoration(
                labelText: 'Height',
                hintText: 'Select',
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField(
              value: selectedWeight,
              items: weight
                  .map((value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (selectedValue) {
                setState(() {
                  selectedWeight = selectedValue.toString();
                });
              },
              decoration: const InputDecoration(
                labelText: 'Weight',
                hintText: 'Select',
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField(
              value: selectedComplexion,
              items: complexion
                  .map((value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (selectedValue) {
                setState(() {
                  selectedComplexion = selectedValue.toString();
                });
              },
              decoration: const InputDecoration(
                labelText: 'Complexion',
                hintText: 'Select',
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField(
              value: selectedMotherTongue,
              onChanged: (value) {
                setState(() {
                  selectedMotherTongue = value;
                });
              },
              items: motherTongue.map((motherTongue) {
                return DropdownMenuItem(
                  value: motherTongue,
                  child: Text(motherTongue),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Mother Tongue',
                hintText: 'Select your Mother Tongue',
              ),
            ),
            const SizedBox(height: 20),
            MultiSelectDialogField(
              items: languagesKnown
                  .map((languagesKnown) =>
                      MultiSelectItem<String>(languagesKnown, languagesKnown))
                  .toList(),
              initialValue: selectedLanguageKnown.toList(),
              title: const Text("Language Known"),
              buttonIcon: Icon(
                Icons.arrow_drop_down,
                color: Colors.grey.shade700,
              ),
              buttonText: const Text(
                "Language Known",
                style: TextStyle(color: Colors.black54),
              ),
              onConfirm: (values) {
                setState(() {
                  selectedLanguageKnown = values.toSet();
                  languageKnownController.text =
                      selectedLanguageKnown.join(", ");
                });
              },
              chipDisplay: MultiSelectChipDisplay<String>(
                // hide the checkmark
                // chipColor: Colors.green,
                icon: const Icon(Icons.close),
                onTap: (value) {
                  setState(() {
                    selectedLanguageKnown.remove(value);
                    languageKnownController.text =
                        selectedLanguageKnown.join(", ");
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: companyNameController,
              decoration: const InputDecoration(
                labelText: 'Company name',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: designationController,
              decoration: const InputDecoration(
                labelText: 'Designation',
              ),
            ),
            const SizedBox(height: 10),
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
              ),
            ),
            const SizedBox(height: 10),
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
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: aboutMeController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'About me',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: fatherNameController,
              decoration: const InputDecoration(
                labelText: "Father's name",
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField(
              value: selectedFatherOccupation,
              onChanged: (value) {
                setState(() {
                  selectedFatherOccupation = value;
                });
              },
              items: fatherOccupations.map((fatherOccupation) {
                return DropdownMenuItem(
                  value: fatherOccupation,
                  child: Text(fatherOccupation),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Father Occupation',
                hintText: 'Select',
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField(
              value: selectedFatherCaste,
              items: castes
                  .map((value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (selectedValue) {
                setState(() {
                  selectedFatherCaste = selectedValue.toString();
                });
              },
              decoration: const InputDecoration(
                labelText: 'Father Caste',
                hintText: 'Select your Father caste',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: motherNameController,
              decoration: const InputDecoration(
                labelText: "Mother's name",
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField(
              value: selectedMotherOccupation,
              onChanged: (value) {
                setState(() {
                  selectedMotherOccupation = value;
                });
              },
              items: motherOccupations.map((motherOccupation) {
                return DropdownMenuItem(
                  value: motherOccupation,
                  child: Text(motherOccupation),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Mother Occupation',
                hintText: 'Select',
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField(
              value: selectedMotherCaste,
              items: castes
                  .map((value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (selectedValue) {
                setState(() {
                  selectedMotherCaste = selectedValue.toString();
                });
              },
              decoration: const InputDecoration(
                labelText: 'Mother Caste',
                hintText: 'Select your Mother caste',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: familyOriginController,
              decoration: const InputDecoration(
                labelText: 'Family origin',
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField(
              value: selectednumberofSiblings,
              items: numberofSiblings
                  .map((value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (selectedValue) {
                setState(() {
                  selectednumberofSiblings = selectedValue.toString();
                });
              },
              decoration: const InputDecoration(
                labelText: 'Number of siblings',
                hintText: 'Number of siblings',
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField(
              value: selectednumberofSiblingsMarried,
              items: numberofSiblingsMarried
                  .map((value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (selectedValue) {
                setState(() {
                  selectednumberofSiblingsMarried = selectedValue.toString();
                });
              },
              decoration: const InputDecoration(
                labelText: 'Number of Siblings Married',
                hintText: 'Number of Siblings Married',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: aboutFamilyController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'About Family',
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MaterialButton(
                onPressed: () {
                  _toggleSide();
                },
                minWidth: double.infinity,
                height: 50,
                color: Colors.green[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                _toggleSide();
              },
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Partner's age",
            ),
            RangeSlider(
              values: ageRange,
              min: 18,
              max: 50,
              divisions: 42,
              onChanged: (RangeValues values) {
                setState(() {
                  ageRange = values;
                  minAgeController.text = values.start.round().toString();
                  maxAgeController.text = values.end.round().toString();
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    controller: minAgeController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Min age",
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    controller: maxAgeController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Max age",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "Partner's height",
            ),
            RangeSlider(
              values: heightRange,
              min: 100,
              max: 250,
              divisions: 150,
              onChanged: (RangeValues values) {
                setState(() {
                  heightRange = values;
                  minHeightController.text = values.start.round().toString();
                  maxHeightController.text = values.end.round().toString();
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    controller: minHeightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Min height",
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    controller: maxHeightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Max height",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "Partner's weight",
            ),
            RangeSlider(
              values: weightRange,
              min: 40,
              max: 200,
              divisions: 32,
              onChanged: (RangeValues values) {
                setState(() {
                  weightRange = values;
                  minWeightController.text = values.start.round().toString();
                  maxWeightController.text = values.end.round().toString();
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    controller: minWeightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Min weight",
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    controller: maxWeightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Max weight",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            partnerCaste(),
            const SizedBox(height: 10),
            DropdownButtonFormField(
              value: selectedPartnerReligion,
              items: partnerReligions
                  .map((value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (selectedValue) {
                setState(() {
                  selectedPartnerReligion = selectedValue.toString();
                });
              },
              // icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
              decoration: const InputDecoration(
                labelText: "Partner's Religion",
                hintText: 'Select',
              ),
            ),
            const SizedBox(height: 30),
            partnerEducation(),
            const SizedBox(height: 30),
            partnerOccupation(),
            const SizedBox(height: 30),
            partnerLanguage(),
            const SizedBox(height: 10),
            TextField(
              controller: partnerAboutController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "About Partner",
              ),
            ),
            const SizedBox(height: 40),
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
                color: Colors.green[400],
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
                            fontSize: 16,
                          )),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  MultiSelectDialogField<String> partnerCaste() {
    sortPartnerCastes();
    return MultiSelectDialogField(
      items: partnerCastes
          .map((caste) => MultiSelectItem<String>(caste, caste))
          .toList(),
      initialValue: selectedPartnerCaste.toList(),
      title: const Text("Partner's caste"),
      buttonIcon: const Icon(Icons.arrow_drop_down),
      buttonText: const Text("Partner's caste"),
      onConfirm: (values) {
        setState(() {
          selectedPartnerCaste = values.toSet();
          partnerCasteController.text = selectedPartnerCaste.join(", ");
        });
      },
      separateSelectedItems: false,
      chipDisplay: MultiSelectChipDisplay<String>(
        // hide the checkmark
        // chipColor: Colors.green,
        icon: const Icon(Icons.close),
        onTap: (value) {
          setState(() {
            selectedPartnerCaste.remove(value);
            partnerEducationController.text = selectedPartnerCaste.join(", ");
          });
        },
      ),
    );
  }

  MultiSelectDialogField<String> partnerEducation() {
    return MultiSelectDialogField(
      items: partnerEducations
          .map((partnerEducation) =>
              MultiSelectItem<String>(partnerEducation, partnerEducation))
          .toList(),
      initialValue: selectedPartnerEducation.toList(),
      title: const Text("Partner's Education"),
      buttonIcon: Icon(
        Icons.arrow_drop_down,
        color: Colors.grey.shade700,
      ),
      buttonText: const Text("Partner's Education"),
      onConfirm: (values) {
        setState(() {
          selectedPartnerEducation = values.toSet();
          partnerEducationController.text = selectedPartnerEducation.join(", ");
        });
      },
    );
  }

  MultiSelectDialogField<String> partnerOccupation() {
    return MultiSelectDialogField(
      items: partnerOccupations
          .map((partnerOccupation) =>
              MultiSelectItem<String>(partnerOccupation, partnerOccupation))
          .toList(),
      initialValue: selectedPartnerOccupation.toList(),
      title: const Text("Partner's Occupation"),
      buttonIcon: Icon(
        Icons.arrow_drop_down,
        color: Colors.grey.shade700,
      ),
      buttonText: const Text("Partner's Occupation"),
      onConfirm: (values) {
        setState(() {
          selectedPartnerOccupation = values.toSet();
          partnerOccupationController.text =
              selectedPartnerOccupation.join(", ");
        });
      },
      separateSelectedItems: false,
      chipDisplay: MultiSelectChipDisplay<String>(
        // hide the checkmark
        // chipColor: Colors.green,
        icon: const Icon(Icons.close),
        onTap: (value) {
          setState(() {
            selectedPartnerOccupation.remove(value);
            partnerOccupationController.text =
                selectedPartnerOccupation.join(", ");
          });
        },
      ),
    );
  }

  MultiSelectDialogField<String> partnerLanguage() {
    return MultiSelectDialogField(
      items: partnerLanguages
          .map((partnerLanguage) =>
              MultiSelectItem<String>(partnerLanguage, partnerLanguage))
          .toList(),
      initialValue: selectedPartnerLanguages.toList(),
      title: const Text("Partner's Language"),
      buttonIcon: Icon(
        Icons.arrow_drop_down,
        color: Colors.grey.shade700,
      ),
      buttonText: const Text("Partner's Language"),
      onConfirm: (values) {
        setState(() {
          selectedPartnerLanguages = values.toSet();
          partnerLanguageController.text = selectedPartnerLanguages.join(", ");
        });
      },
      separateSelectedItems: false,
      chipDisplay: MultiSelectChipDisplay<String>(
        // hide the checkmark
        // chipColor: Colors.green,
        icon: const Icon(Icons.close),
        onTap: (value) {
          setState(() {
            selectedPartnerLanguages.remove(value);
            partnerLanguageController.text =
                selectedPartnerLanguages.join(", ");
          });
        },
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
          age.isEmpty ||
          genders.isEmpty ||
          maritalStatuses.isEmpty ||
          religions.isEmpty ||
          castes.isEmpty ||
          educations.isEmpty ||
          motherTongue.isEmpty ||
          languagesKnown.isEmpty ||
          companyNameController.text.isEmpty ||
          designationController.text.isEmpty ||
          // employmentType.isEmpty ||
          // salaries.isEmpty ||
          countries.isEmpty ||
          stateController.text.isEmpty ||
          cityController.text.isEmpty ||
          fatherNameController.text.isEmpty ||
          // fatherOccupation.isEmpty ||
          motherNameController.text.isEmpty ||
          // motherOccupation.isEmpty ||
          fatherCaste.isEmpty ||
          motherCaste.isEmpty ||
          familyOriginController.text.isEmpty ||
          // siblings.isEmpty ||
          // siblingsMarried.isEmpty ||
          aboutMeController.text.isEmpty ||
          aboutFamilyController.text.isEmpty ||
          height.isEmpty ||
          weight.isEmpty ||
          complexion.isEmpty ||
          // partnerAge.isEmpty ||
          // partnerHeight.isEmpty ||
          // partnerWeight.isEmpty ||
          partnerCasteController.text.isEmpty ||
          partnerReligions.isEmpty ||
          partnerEducations.isEmpty ||
          partnerOccupations.isEmpty ||
          partnerLanguages.isEmpty ||
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
          'age': age,
          'gender': genders,
          'maritalStatus': maritalStatuses,
          'religion': religions,
          'caste': castes,
          'education': educations,
          'motherTongue': motherTongue,
          'languageKnown': languagesKnown,
          'companyName': companyNameController.text,
          'designation': designationController.text,
          // 'employmentType': employmentType,
          'salary': incomes,
          'country': countries,
          'state': stateController.text,
          'city': cityController.text,
          'fatherName': fatherNameController.text,
          'fatherOccupation': fatherOccupations,
          'motherName': motherNameController.text,
          'motherOccupation': motherOccupations,
          'fatherCaste': fatherCaste,
          'motherCaste': motherCaste,
          'familyOrigin': familyOriginController.text,
          'siblings': numberofSiblings,
          'siblingsMarried': numberofSiblingsMarried,
          'aboutMe': aboutMeController.text,
          'aboutFamily': aboutFamilyController.text,
          'height': height,
          'weight': weight,
          'complexion': complexion,

          'partnerAge': '${minAgeController.text}-${maxAgeController.text}',
          'partnerHeight':
              '${minHeightController.text}-${maxHeightController.text}',
          'partnerWeight':
              '${minWeightController.text}-${maxWeightController.text}',
          'partnerCaste': partnerCasteController.text,
          'partnerReligion': partnerReligions,
          'partnerEducation': partnerEducation,
          'partnerOccupation': partnerOccupation,
          'partnerLanguage': partnerLanguage,
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
