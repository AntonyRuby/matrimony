// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'dart:async';
// import 'package:http/http.dart' as http;

// class UserRepository {
//   final _dio = Dio();
//   final _baseUrl = 'http://your-api-base-url.com/api';

//   Future<void> register(
//       {required int id,
//       required String name,
//       required String phoneNumber,
//       required String password,
//       required String image,
//       required String dateOfBirth,
//       required String age,
//       required String gender,
//       required String maritalStatus,
//       required String religion,
//       required String caste,
//       required String education,
//       required String motherTongue,
//       required String companyName,
//       required String designation,
//       required String employmentType,
//       required String salary,
//       required String country,
//       required String state,
//       required String city,
//       required String fatherName,
//       required String fatherOccupation,
//       required String motherName,
//       required String motherOccupation,
//       required String fatherCaste,
//       required String motherCaste,
//       required String familyOrigin,
//       required String familySerial,
//       required String numberOfSiblings,
//       required String married,
//       required String aboutMyFamily,
//       required String aboutMe,
//       required String height,
//       required String weight,
//       required String complexion,
//       required String partnerAge,
//       required String partnerHeight,
//       required String partnerWeight,
//       required String partnerCaste,
//       required String partnerReligion,
//       required String partnerEducation,
//       required String partnerOccupation,
//       required String partnerLanguage,
//       required String partnerAbout}) async {
//     try {
//       final response = await _dio.post(
//         '$_baseUrl/register',
//         data: {
//           'id': id,
//           'name': name,
//           'phoneNumber': phoneNumber,
//           'password': password,
//           'image': image,
//           'dateOfBirth': dateOfBirth,
//           'age': age,
//           'gender': gender,
//           'maritalStatus': maritalStatus,
//           'religion': religion,
//           'caste': caste,
//           'education': education,
//           'motherTongue': motherTongue,
//           'companyName': companyName,
//           'designation': designation,
//           'employmentType': employmentType,
//           'salary': salary,
//           'country': country,
//           'state': state,
//           'city': city,
//           'fatherName': fatherName,
//           'fatherOccupation': fatherOccupation,
//           'motherName': motherName,
//           'motherOccupation': motherOccupation,
//           'fatherCaste': fatherCaste,
//           'motherCaste': motherCaste,
//           'familyOrigin': familyOrigin,
//           'familySerial': familySerial,
//           'numberOfSiblings': numberOfSiblings,
//           'married': married,
//           'aboutMyFamily': aboutMyFamily,
//           'aboutMe': aboutMe,
//           'height': height,
//           'weight': weight,
//           'complexion': complexion,
//           'partnerAge': partnerAge,
//           'partnerHeight': partnerHeight,
//           'partnerWeight': partnerWeight,
//           'partnerCaste': partnerCaste,
//           'partnerReligion': partnerReligion,
//           'partnerEducation': partnerEducation,
//           'partnerOccupation': partnerOccupation,
//           'partnerLanguage': partnerLanguage,
//           'partnerAbout': partnerAbout,
//         },
//       );

//       final responseData = response.data;

//       if (responseData['status'] == 'success') {
//         // Registration successful
//       } else {
//         throw responseData['message'];
//       }
//     } catch (error) {
//       rethrow;
//     }
//   }

//   Future<Response> login(
//       {required String phoneNumber, required String password}) async {
//     try {
//       final response = await _dio.post(
//         '/login',
//         data: {
//           'phoneNumber': phoneNumber,
//           'password': password,
//         },
//       );
//       return response;
//     } catch (error) {
//       rethrow;
//     }
//   }

//   Future<void> uploadImage(File image) async {
//     // Define the API endpoint
//     final url = Uri.parse('https://example.com/api/upload');

//     // Create the multipart request
//     final request = http.MultipartRequest('POST', url);

//     // Add the image file to the request
//     final imageStream = http.ByteStream(image.openRead());
//     final imageLength = await image.length();
//     final multipartFile = http.MultipartFile('image', imageStream, imageLength,
//         filename: image.path);

//     request.files.add(multipartFile);

//     // Send the request
//     final response = await request.send();
//   }
// }
