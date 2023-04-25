class Utils {
  bool validatePhoneNumber(String phoneNumber) {
    final RegExp regex = RegExp(r'^\+?[1-9]\d{1,14}$');
    return regex.hasMatch(phoneNumber);
  }
}

class PhoneNumberValidator {
  static final RegExp _phoneRegex = RegExp(
    r'^\+?\d{10,15}$',
  );

  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    } else if (!_phoneRegex.hasMatch(value)) {
      return 'Invalid phone number';
    }
    return null;
  }
}
