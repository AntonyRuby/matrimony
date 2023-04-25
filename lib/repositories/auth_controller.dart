// import 'package:get/get.dart';
// import 'package:matrimony/repositories/user_respositories.dart';

// class AuthController extends GetxController {
//   final _userRepository = UserRepository();
//   final _authToken = ''.obs;

//   String get authToken => _authToken.value;

//   Future<void> login({
//     required String phoneNumber,
//     required String password,
//   }) async {
//     try {
//       final response = await _userRepository.login(
//         phoneNumber: phoneNumber,
//         password: password,
//       );

//       final responseData = response.data;

//       if (responseData['status'] == 'success') {
//         _authToken.value = responseData['data']['authToken'];
//       } else {
//         throw responseData['message'];
//       }
//     } catch (error) {
//       rethrow;
//     }
//   }

//   Future<void> logout() async {
//     _authToken.value = '';
//   }
// }
