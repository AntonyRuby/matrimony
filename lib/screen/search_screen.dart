import 'package:flutter/material.dart';

class User {
  final int id;
  final String name;
  final String image;
  final String caste;
  final String religion;
  final String occupation;
  final String gender;
  final String ageRange;
  final String language;

  User({
    required this.id,
    required this.name,
    required this.image,
    required this.caste,
    required this.religion,
    required this.occupation,
    required this.gender,
    required this.ageRange,
    required this.language,
  });
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _selectedGender = '';

  Set<String> selectedAgeRange = Set<String>();

  String _selectedReligion = '';
  Set<String> selectedLanguages = Set<String>();

  final List<String> _genders = ['Male', 'Female'];
  final List<String> _ageRanges = [
    '18-25',
    '26-30',
    '31-35',
    '36-40',
    '41-45',
    '46-50',
    '50+'
  ];
  final List<String> _religions = [
    'Hindu',
    'Muslim',
    'Christian',
    'Sikh',
    'Buddhist',
    'Jain',
    'Other'
  ];
  final List<String> _languages = [
    'English',
    'Hindi',
    'Tamil',
    'Telugu',
    'Kannada',
    'Malayalam',
    'Other'
  ];
  List<User> _searchResults = [];
  List<User> users = [
    User(
      id: 1,
      name: 'John Doe',
      image: 'assets/images/image.png',
      caste: 'Caste 1',
      religion: 'Hindu',
      occupation: 'Job 1',
      gender: 'Male',
      ageRange: '26-30',
      language: 'English',
    ),
    User(
      id: 2,
      name: 'Jane Doe',
      image: 'assets/images/image.png',
      caste: 'Caste 2',
      religion: 'Muslim',
      occupation: 'Job 2',
      gender: 'Female',
      ageRange: '31-35',
      language: 'Hindi',
    ),
    User(
      id: 3,
      name: 'Bob Smith',
      image: 'assets/images/image.png',
      caste: 'Caste 3',
      religion: 'Christian',
      occupation: 'Job 3',
      gender: 'Male',
      ageRange: '41-45',
      language: 'Tamil',
    ),
    User(
      id: 4,
      name: 'Alice Smith',
      image: 'assets/images/image.png',
      caste: 'Caste 4',
      religion: 'Sikh',
      occupation: 'Job 4',
      gender: 'Female',
      ageRange: '50+',
      language: 'Telugu',
    ),
    User(
      id: 5,
      name: 'Jack Johnson',
      image: 'assets/images/image.png',
      caste: 'Caste 5',
      religion: 'Buddhist',
      occupation: 'Job 5',
      gender: 'Male',
      ageRange: '36-40',
      language: 'Kannada',
    ),
    User(
      id: 6,
      name: 'Jack',
      image: 'assets/images/image.png',
      caste: 'Caste 5',
      religion: 'Buddhist',
      occupation: 'Job 5',
      gender: 'Male',
      ageRange: '36-40',
      language: 'Kannada',
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
      // if (selectedAgeRange.isNotEmpty &&
      //     !selectedAgeRange.any((ageRange) =>
      //         user.ageRange >= int.parse(ageRange.split('-')[0]) &&
      //         user.age <= int.parse(ageRange.split('-')[1]))) {
      //   return false;
      // }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
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
            Expanded(
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
                                subtitle: Text(user.occupation),
                                trailing: Text(user.ageRange),
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
    );
  }
}
