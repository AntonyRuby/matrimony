import 'package:flutter/material.dart';
import 'package:matrimony/screen/home_screen/home_screen.dart';

class User {
  final int id;
  final String name;
  final String image;
  final String caste;
  final String religion;
  final String occupation;
  final String gender;
  final int age;
  final String salary;
  final String language;

  User({
    required this.id,
    required this.name,
    required this.image,
    required this.caste,
    required this.religion,
    required this.occupation,
    required this.gender,
    required this.age,
    required this.salary,
    required this.language,
  });
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> _genders = ['Male', 'Female'];
  String _selectedGender = '';

  final List<String> _ageRanges = [
    '18-25',
    '26-30',
    '31-35',
    '36-40',
    '41-45',
    '46-50',
    'More than 50'
  ];
  Set<String> selectedAgeRange = <String>{};

  final List<String> salaryRanges = [
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
  Set<String> selectedSalaryRange = <String>{};

  final List<String> _religions = [
    'Hindu',
    'Muslim',
    'Christian',
    'Sikh',
    'Buddhist',
    'Jain',
    'Other'
  ];
  String _selectedReligion = '';

  final List<String> _languages = [
    'English',
    'Hindi',
    'Tamil',
    'Telugu',
    'Kannada',
    'Malayalam',
    'Other'
  ];
  Set<String> selectedLanguages = <String>{};

  String selectedOccupation = '';

  final List<String> caste = [
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

  Set<String> selectedCaste = <String>{};

  List<User> _searchResults = [];
  List<User> users = [
    User(
      id: 1,
      name: 'John Doe',
      image: 'https://images.unsplash.com/photo-1521747116042-5a810fda9664',
      caste: 'Vanniyar',
      religion: 'Hindu',
      occupation: 'Job 1',
      gender: 'Male',
      age: 26,
      language: 'English',
      salary: '\$40,000',
    ),
    User(
      id: 2,
      name: 'Jane Doe',
      image: 'https://images.unsplash.com/photo-1521747116042-5a810fda9664',
      caste: 'Jat',
      religion: 'Muslim',
      occupation: 'Job 2',
      gender: 'Female',
      age: 31,
      language: 'Hindi',
      salary: '\$60,000',
    ),
    User(
      id: 3,
      name: 'Bob Smith',
      image: 'https://images.unsplash.com/photo-1521747116042-5a810fda9664',
      caste: 'Caste 3',
      religion: 'Christian',
      occupation: 'Job 3',
      gender: 'Male',
      age: 41,
      language: 'Tamil',
      salary: '\$70,000',
    ),
    User(
      id: 4,
      name: 'Alice Smith',
      image: 'https://images.unsplash.com/photo-1521747116042-5a810fda9664',
      caste: 'Caste 4',
      religion: 'Sikh',
      occupation: 'Job 4',
      gender: 'Female',
      age: 50,
      language: 'Telugu',
      salary: '\$80,000',
    ),
    User(
      id: 5,
      name: 'Jack Johnson',
      image: 'https://images.unsplash.com/photo-1521747116042-5a810fda9664',
      caste: 'Chettiar',
      religion: 'Buddhist',
      occupation: 'Job 5',
      gender: 'Male',
      age: 36,
      language: 'Kannada',
      salary: '\$90,000',
    ),
    User(
      id: 6,
      name: 'Jack',
      image: 'https://images.unsplash.com/photo-1521747116042-5a810fda9664',
      caste: 'Caste 5',
      religion: 'Buddhist',
      occupation: 'Job 5',
      gender: 'Male',
      age: 24,
      language: 'Kannada',
      salary: '\$50,000',
    ),
  ];

  List<User> _performSearch() {
    return users.where((user) {
      if (_selectedGender.isNotEmpty && user.gender != _selectedGender) {
        return false;
      }
      if (_selectedReligion.isNotEmpty && user.religion != _selectedReligion) {
        return false;
      }
      if (selectedLanguages.isNotEmpty &&
          !selectedLanguages.contains(user.language)) {
        return false;
      }
      if (selectedAgeRange.isNotEmpty &&
          !selectedAgeRange.any((ageRange) {
            final minAge = int.parse(ageRange
                .split('-')[0]
                .replaceAll('\$', '')
                .replaceAll(',', '')
                .trim());
            final maxAge = int.parse(ageRange
                .split('-')[1]
                .replaceAll('\$', '')
                .replaceAll(',', '')
                .trim());
            return user.age >= minAge && user.age <= maxAge;
          })) {
        return false;
      }

      if (selectedOccupation.isNotEmpty &&
          user.occupation != selectedOccupation) {
        return false;
      }
      if (selectedCaste.isNotEmpty && !selectedCaste.contains(user.caste)) {
        return false;
      }

      if (selectedSalaryRange.isNotEmpty) {
        return selectedSalaryRange.any((salaryRange) {
          final minSalary = int.parse(salaryRange
              .split('-')[0]
              .replaceAll('\$', '')
              .replaceAll(',', '')
              .trim());
          final maxSalary = int.parse(salaryRange
              .split('-')[1]
              .replaceAll('\$', '')
              .replaceAll(',', '')
              .trim());
          return int.parse(
                      user.salary.replaceAll('\$', '').replaceAll(',', '')) >=
                  minSalary &&
              int.parse(user.salary.replaceAll('\$', '').replaceAll(',', '')) <=
                  maxSalary;
        });
      } else {
        // No salary range selected, show all users
        return true;
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Gender',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Wrap(
                children: _genders
                    .map((gender) => ChoiceChip(
                          label: Text(gender),
                          selected: _selectedGender == gender,
                          onSelected: (selected) {
                            setState(() {
                              _selectedGender = selected ? gender : '';
                              _searchResults = _performSearch();
                            });
                          },
                        ))
                    .toList(),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text(
                'Age Range',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Wrap(
                children: _ageRanges
                    .map((ageRange) => ChoiceChip(
                          label: Text(ageRange),
                          selected: selectedAgeRange.contains(ageRange),
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                selectedAgeRange.add(ageRange);
                              } else {
                                selectedAgeRange.remove(ageRange);
                              }
                            });
                          },
                        ))
                    .toList(),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text(
                'Salary Range',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Wrap(
                children: salaryRanges
                    .map((salaryRanges) => ChoiceChip(
                          label: Text(salaryRanges),
                          selected: selectedAgeRange.contains(salaryRanges),
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                selectedAgeRange.add(salaryRanges);
                              } else {
                                selectedAgeRange.remove(salaryRanges);
                              }
                            });
                          },
                        ))
                    .toList(),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text(
                'Religion',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Wrap(
                children: _religions
                    .map((religion) => ChoiceChip(
                          label: Text(religion),
                          selected: _selectedReligion == religion,
                          onSelected: (selected) {
                            setState(() {
                              _selectedReligion = selected ? religion : '';
                              _searchResults = _performSearch();
                            });
                          },
                        ))
                    .toList(),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text(
                'Language',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Wrap(
                children: _languages
                    .map((language) => ChoiceChip(
                          label: Text(language),
                          selected: selectedLanguages.contains(language),
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                selectedLanguages.add(language);
                              } else {
                                selectedLanguages.remove(language);
                              }
                            });
                          },
                        ))
                    .toList(),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text(
                'Caste',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Wrap(
                children: caste
                    .map((caste) => ChoiceChip(
                          label: Text(caste),
                          selected: selectedCaste.contains(caste),
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                selectedCaste.add(caste);
                              } else {
                                selectedCaste.remove(caste);
                              }
                            });
                          },
                        ))
                    .toList(),
              ),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _searchResults = _performSearch();
                  });
                },
                child: const Text('Search'),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 950,
                child: _searchResults.isNotEmpty
                    ? GridView.builder(
                        itemCount: _searchResults.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemBuilder: (context, index) {
                          final user = _searchResults[index];
                          return Card(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Image.network(
                                    user.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                ListTile(
                                  title: Text(user.name),
                                  subtitle: Text(user.caste),
                                  trailing: Text(user.age.toString()),
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: Text('No Results'),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
