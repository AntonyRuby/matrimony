class User {
  final String id;
  final String name;
  final String phoneNumber;
  final String password;
  final bool isNewUser;
  final String image;
  final DateTime dateOfBirth;
  final int age;
  final String gender;
  final String maritalStatus;
  final String religion;
  final String caste;
  final String education;
  final String motherTongue;
  final String languageKnown;
  final String companyName;
  final String designation;
  final String employmentType;
  final double salary;
  final String country;
  final String state;
  final String city;
  final String fatherName;
  final String fatherOccupation;
  final String motherName;
  final String motherOccupation;
  final String fatherCaste;
  final String motherCaste;
  final String familyOrigin;
  final int siblings;
  final int siblingsMarried;
  final String aboutMe;
  final String aboutFamily;
  final double height;
  final double weight;
  final String complexion;
  final int partnerAge;
  final double partnerHeight;
  final double partnerWeight;
  final String partnerCaste;
  final String partnerReligion;
  final String partnerEducation;
  final String partnerOccupation;
  final String partnerLanguage;
  final String partnerAbout;

  User({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.password,
    required this.isNewUser,
    required this.image,
    required this.dateOfBirth,
    required this.age,
    required this.gender,
    required this.maritalStatus,
    required this.religion,
    required this.caste,
    required this.education,
    required this.motherTongue,
    required this.languageKnown,
    required this.companyName,
    required this.designation,
    required this.employmentType,
    required this.salary,
    required this.country,
    required this.state,
    required this.city,
    required this.fatherName,
    required this.fatherOccupation,
    required this.motherName,
    required this.motherOccupation,
    required this.fatherCaste,
    required this.motherCaste,
    required this.familyOrigin,
    required this.siblings,
    required this.siblingsMarried,
    required this.aboutMe,
    required this.aboutFamily,
    required this.height,
    required this.weight,
    required this.complexion,
    required this.partnerAge,
    required this.partnerHeight,
    required this.partnerWeight,
    required this.partnerCaste,
    required this.partnerReligion,
    required this.partnerEducation,
    required this.partnerOccupation,
    required this.partnerLanguage,
    required this.partnerAbout,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
      isNewUser: json['isNewUser'] ?? false,
      image: json['image'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      age: json['age'],
      gender: json['gender'],
      maritalStatus: json['maritalStatus'],
      religion: json['religion'],
      caste: json['caste'],
      education: json['education'],
      motherTongue: json['motherTongue'],
      languageKnown: json['languageKnown'],
      companyName: json['companyName'],
      designation: json['designation'],
      employmentType: json['employmentType'],
      salary: json['salary'],
      country: json['country'],
      state: json['state'],
      city: json['city'],
      fatherName: json['fatherName'],
      fatherOccupation: json['fatherOccupation'],
      motherName: json['motherName'],
      motherOccupation: json['motherOccupation'],
      fatherCaste: json['fatherCaste'],
      motherCaste: json['motherCaste'],
      familyOrigin: json['familyOrigin'],
      siblings: json['siblings'],
      siblingsMarried: json['siblingsMarried'],
      aboutMe: json['aboutMe'],
      aboutFamily: json['aboutFamily'],
      height: json['height'],
      weight: json['weight'],
      complexion: json['complexion'],
      partnerAge: json['partnerAge'],
      partnerHeight: json['partnerHeight'],
      partnerWeight: json['partnerWeight'],
      partnerCaste: json['partnerCaste'],
      partnerReligion: json['partnerReligion'],
      partnerEducation: json['partnerEducation'],
      partnerOccupation: json['partnerOccupation'],
      partnerLanguage: json['partnerLanguage'],
      partnerAbout: json['partnerAbout'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'image': image,
      'password': password,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'age': age,
      'gender': gender,
      'maritalStatus': maritalStatus,
      'religion': religion,
      'caste': caste,
      'education': education,
      'motherTongue': motherTongue,
      'languageKnown': languageKnown,
      'companyName': companyName,
      'designation': designation,
      'employmentType': employmentType,
      'salary': salary,
      'country': country,
      'state': state,
      'city': city,
      'fatherName': fatherName,
      'fatherOccupation': fatherOccupation,
      'motherName': motherName,
      'motherOccupation': motherOccupation,
      'fatherCaste': fatherCaste,
      'motherCaste': motherCaste,
      'familyOrigin': familyOrigin,
      'siblings': siblings,
      'siblingsMarried': siblingsMarried,
      'aboutMe': aboutMe,
      'aboutFamily': aboutFamily,
      'height': height,
      'weight': weight,
      'complexion': complexion,
      'partnerAge': partnerAge,
      'partnerHeight': partnerHeight,
      'partnerWeight': partnerWeight,
      'partnerCaste': partnerCaste,
      'partnerReligion': partnerReligion,
      'partnerEducation': partnerEducation,
      'partnerOccupation': partnerOccupation,
      'partnerLanguage': partnerLanguage,
      'partnerAbout': partnerAbout,
    };
  }
}
